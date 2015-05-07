class EventsController < ApplicationController

  def create
    render :json => params
  end

end