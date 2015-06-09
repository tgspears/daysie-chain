class SessionsController < ApplicationController

    def create
    user = User.find_by_email(params[:user][:email])
    unless params[:user][:password].empty?
      if user
        @user = user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        flash[:success] = "Login successful!"
        redirect_to user_groups_path(@user.id)
      else
        flash[:danger] = "Invalid login."
        redirect_to root_path
      end
    else
      flash[:danger] = "Password field was blank"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = 'Logged Out: Have a nice day!'
    redirect_to root_path
  end

  def show

  end

end