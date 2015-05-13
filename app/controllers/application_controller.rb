class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :current_user

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def is_authenticated?
    unless current_user
      flash[:danger] = "You do not have sufficient permissions to view this page. Please login."
      redirect_to root_path
    end
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  rescue ActiveRecord::RecordNotFound
    flash[:danger] = "We couldn't find whatever you were looking for. Sorry!"
    redirect_to root_path
end
