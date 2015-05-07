class EventsController < ApplicationController

  def create
    render :json => params
  end

  def update
    render :json => params
  end

end