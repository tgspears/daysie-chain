class SessionsController < ApplicationController

    def create
    user = User.find_by_email(params[:user][:email])
    @user = user.authenticate(params[:user][:password])
    if @user
      session[:user_id] = @user.id
      flash[:success] = "Login successful!"
      redirect_to root_path
    else
      flash[:danger] = "Invalid login."
      redirect_to root_path
    end
    # render :json => params[:user]
  end

  def destroy

  end

end