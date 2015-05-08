class UsersController < ApplicationController

  def index
    @user = User.new
  end

  def create

    unless User.find_by_email(params[:user][:email])
      @user = User.create :firstname => params[:user][:firstname], :lastname => params[:user][:lastname], :email => params[:user][:email], :tel => params[:user][:tel], :password => params[:user][:password]
       session[:user_id] = @user.id
    else
      render :plain => 'ERROR DICKHEAD'
    end
    # render :json => @user
    redirect_to user_groups_path(@user.id)
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = 'you have been logged out'
    redirect_to root_path
  end

  def show
    @user = @current_user
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :tel, :password)
  end


end