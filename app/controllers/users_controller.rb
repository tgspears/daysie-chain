class UsersController < ApplicationController

  def new
    @user = User.new

    render layout: false
  end

  def index
   @user = User.new
   if session[:user_id] != nil
      redirect_to user_groups_path(@current_user.id)
   end
  end

  def create
    if session[:user_id] != nil
      unless User.find_by_email(params[:user][:email])
        user = User.create :firstname => params[:user][:firstname], :lastname => params[:user][:lastname], :email => params[:user][:email], :tel => params[:user][:tel], :active => params[:user][:active]
        group = Group.find(params[:user][:group_id])
        user.memberships << group.memberships.create(admin:false)
        redirect_to user_groups_path(@current_user.id)
      else
        user = User.find_by_email(params[:user][:email])
        group = Group.find(params[:user][:group_id])
        user.memberships << group.memberships.create(admin:false)
        redirect_to user_groups_path(@current_user.id)
      end
    else
      unless User.find_by_email(params[:user][:email])
        unless params[:user][:picture] == nil
        uploaded_file = params[:user][:picture].path
        cloudinary_file = Cloudinary::Uploader.upload(uploaded_file)
        cloudinary_file = cloudinary_file["public_id"];
        else
        cloudinary_file = User.default_picture
        end
        @user = User.create :firstname => params[:user][:firstname], :lastname => params[:user][:lastname], :email => params[:user][:email], :tel => params[:user][:tel], :password => params[:user][:password], :image => cloudinary_file, :active => params[:user][:active]

        if @user.id
        session[:user_id] = @user.id
        redirect_to user_groups_path(@user.id)
        else
        render :plain => "Something went wrong when trying to sign you up.  Perhaps your password was lame.  Perhaps your e-mail wasn'nt an e-mail.  Figure it out."
        end
      else
        render :plain => 'Deja Vu: That e-mail address looks familiar.'
      end
    end
    # render :json => @user

  end

  def destroy
    session[:user_id] = nil
    flash[:info] = 'you have been logged out'
    redirect_to root_path
  end

  def show
    @user = @current_user
  end

  def update
    group_id = params[:groupId]
    members = params[:members]
    admins = params[:admins]
    members.each do |id|
      user = User.find(id)
      user.memberships.find_by_group_id(group_id).update(admin: false)
      user.save
    end
    admins.each do |id|
      user = User.find(id)
      user.memberships.find_by_group_id(group_id).update(admin:true)
      user.save
    end
    render :json => params

  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :tel, :password)
  end


end