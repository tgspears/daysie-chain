class EventsController < ApplicationController
respond_to :html, :xml, :json


  def new
    @group = Group.find(params[:group_id])
    @event = Event.new
    render layout: false
  end


  def create
    # render :json => params
    @user = User.find(params[:user_id])
    group = Group.find(params[:group_id])
    if group.events << Event.create(event_params)
      redirect_to user_groups_path
    else
      flash[:danger] = "Please fill in all fields"
      redirect_to user_groups_path
    end
  end

  def edit
    @group = Group.find(params[:group_id])
    @event = Event.find(params[:id])
    render layout: false
  end

  def show
    @user = User.find(params[:user_id])
    @users = User.all
    @group = Group.find(params[:group_id])
    @event = Event.find(params[:id])
    @attendances = Attendance.all
    render layout: false
  end

  def update
    user = current_user
    @event = Event.find(params[:id])
    @event.min = params[:event][:min]
    @event.max = params[:event][:max]
    @event.date = params[:event][:date]
    @event.day = params[:event][:day]
    @event.time = params[:event][:time]
    @event.active = true;
    if @event.save
      Membership.where(:group_id => @event[:group_id]).each do |member|
        this_member = User.find(member[:user_id])
        this_member.attendances << @event.attendances.create(yes: false, no: false, maybe: false, invited: true)
      end
    else
      flash[:danger] = "Please fill in all required fields"
    end

    # put your own credentials here
    account_sid = ENV['TWILIO_KEY']
    auth_token = ENV['TWILIO_SECRET']
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
    @event.group.memberships.each do |member|
      date = @event.date.split("-")
      number = member.user.tel
      name = member.user.firstname
      @client.account.messages.create({
      :from => '+12073583459',
      :to => number,
      :body => "A Message From Daysie-Chain: \n #{name}, you've been invited to #{@event.name} on #{@event.date}, #{@event.time}.  You down?  Reply 'yes #{@event.id}' or 'no #{@event.id}'"
      })
    end
    redirect_to user_groups_path
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to user_groups_path
  end

  def nudge
    current_user = User.find(params[:current_user_id])[:firstname]
    user = User.find(params[:user_id])
    name = user[:firstname]
    event = Event.find(params[:event_id])
    event_name = event[:name]
    number = user[:tel]
    account_sid = ENV['TWILIO_KEY']
    auth_token = ENV['TWILIO_SECRET']
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create({
      :from => '+12073583459',
      :to => number,
      :body => "A Message From Daysie-Chain: \n #{name}, you were invited to #{event_name} on #{event[:date]}, and #{current_user} thinks it's hella lame that you haven't RSVP'd. Get on your game, homie! Reply 'yes #{params[:event_id]}' or 'no #{params[:event_id]}'"
    })
    redirect_to user_groups_path
  end

  def shade
    current_user = User.find(params[:current_user_id])[:firstname]
    user = User.find(params[:user_id])
    name = user[:firstname]
    event = Event.find(params[:event_id])
    event_name = event[:name]
    number = user[:tel]
    account_sid = ENV['TWILIO_KEY']
    auth_token = ENV['TWILIO_SECRET']
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create({
      :from => '+12073583459',
      :to => number,
      :body => "A Message From Daysie-Chain: \n#{name}, #{current_user} knows that you're not going to #{event_name}. #{current_user} knows, and thinks it's whack.  In fact, #{current_user} thinks YOU'RE whack.  Fear not, reply 'yes #{params[:event_id]}' at any time to change your RSVP."
    })
    redirect_to user_groups_path
  end



  def textmessage
      response_array = params["Body"].split(" ")
      body = response_array[0]
      event = response_array[1].to_i
      number = params["From"].to_i
      user = User.find_by_tel(number)
      p "right above the first if statement"
      p "I found the user: #{user}"
      p "the event number is : #{event}"
      p "the phone number i got the message from is #{number}"
      p "this is user.attendances.find_by_event_id(event)[:invited]:"
      if user.attendances.find_by_event_id(event)[:invited] == true
        p "Made it past the first if statement"
        if body.downcase == 'yes'
          attendance = user.attendances.find_by_event_id(event)
          attendance[:yes] = true
          attendance[:maybe] = false
          attendance[:no] = false
          attendance.save
          Event.each do |event|
            p "**************************************"
            if event[:min] != nil
              if event.attendances.where(:yes => true).length == event[:min]
                event.attendances.each do |attendance|
                   @client.account.messages.create({
                    :from => '+12073583459',
                    :to => attendance.user[:tel],
                    :body => "A Message From Daysie-Chain: \n #{attendance.user[:firstname]}, enough of your friends have RSVP'ed 'Yes' to #{event[:name]}, and it's on!  Be there (#{event[:loc]}, #{event[:date]} : #{event[:time]}) or be square."
                   })
                end
              end
            end
          end
        elsif body.downcase == 'no'
          attendance = user.attendances.find_by_event_id(event)
          attendance[:yes] = false
          attendance[:maybe] = false
          attendance[:no] = true
          attendance.save
        else
          p "the params are #{params}. Also, this fucking failed."
          render :json => params
        end
      else
        render :json => params
      end



  end

  private

  def event_params
    params.require(:event).permit(:name, :desc, :max, :loc, :date)
  end

end
