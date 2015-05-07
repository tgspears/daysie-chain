class SessionsController < ApplicationController

    def create
    user = User.find_by_email(params[:user][:email])
    @user = user.authenticate(params[:user][:password])
    if @user
      session[:user_id] = @user.id
      flash[:success] = "Login successful!"
      redirect_to user_groups_path(@user.id)
    else
      flash[:danger] = "Invalid login."
      redirect_to root_path
    end
    # render :json => params[:user]
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = 'you have been logged out'
    redirect_to root_path
  end

  def show

  end

end