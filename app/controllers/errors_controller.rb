class ErrorsController < ApplicationController

  def not_found
    render :file => 'public/404.html'
  end

  def not_acceptable
    render :file => 'public/422.html'
  end

  def internal_server_error
    render :file => 'public/500.html'
  end

end