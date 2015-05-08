class EventsController < ApplicationController

  def create
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
    event = Event.find(params[:id])

    p "This is the event: #{event.inspect}"

    p "This is the user: #{user.inspect}"
    event.min = params[:event_send][:min]
    event.max = params[:event_send][:max]
    event.day = params[:event_send][:day]
    event.time = params[:event_send][:time]
    event.save
    user.attendances << event.attendances.create(yes: false, no: false, maybe: false, count:0)
    render :json => params
  end

  private

  def event_params
    params.require(:new_event).permit(:name, :desc, :max, :loc, :date)
  end

end
