class AuthController < ApplicationController

  def logout
    session[:user_id] = nil
    flash[:info] = 'you have been logged out'
    redirect_to root_path
  end

  def failure
    render :plain => 'u suk'
  end

  def callback
    provider_user = request.env['omniauth.auth']


    user = User.find_or_create_by(provider_id:provider_user['uid'], provider: provider_user[:provider] ) do |user|
      user.email = provider_user['info']['email']
      user.firstname = provider_user['info']['first_name']
      user.lastname = provider_user['info']['last_name']
      user.provider_hash = provider_user['credentials']['token']
      user.password = "123456789"
    end
    @user = user
    session[:user_id] = user.id
    flash[:success] = 'logged in with facebook!'

    redirect_to user_groups_path(@user.id)

  end

end