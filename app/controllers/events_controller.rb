class EventsController < ApplicationController
respond_to :html, :xml, :json

  def new

  end


  def create
    # render :json => params
    user = User.find(params[:user_id])
    group = user.groups.find(params[:group_id])
    group.events << Event.create(event_params)

  end

  def edit
    @group = Group.find(params[:group_id])
    @event = Event.find(params[:id])
    p "This is the event: #{@event.inspect}"
    p "This is the group: #{@group.inspect}"
    render layout: false
  end

  def update
    user = current_user
    @event = Event.find(params[:id])
    @event.min = params[:event][:min]
    @event.max = params[:event][:max]
    @event.day = params[:event][:day]
    @event.time = params[:event][:time]
    @event.save
    user.attendances << @event.attendances.create(yes: false, no: false, maybe: false, count:0)
    render :json => @event
  end

  private

  def event_params
    params.require(:new_event).permit(:name, :desc, :max, :loc, :date)
  end

end
