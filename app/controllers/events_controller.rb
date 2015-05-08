class EventsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    group = user.groups.find(params[:group_id])
    group.events << Event.create(event_params)

  end

  def update
    # p params
    # event.min = params['event_send']['min']
    # event.max = params['event_send']['max']
    # event.day = params['event_send']['day']
    # event.time = params['event_send']['time']
    # event.save
    render :json => params
  end

  private

  def event_params
    params.require(:new_event).permit(:name, :desc, :max, :loc, :date)
  end

end
