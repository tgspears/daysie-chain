class EventsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    group = user.groups.find(params[:group_id])
    group.events << Event.create(event_params)

  end


  private

  def event_params
    params.require(:new_event).permit(:name, :desc, :max, :loc, :date)
  end
end