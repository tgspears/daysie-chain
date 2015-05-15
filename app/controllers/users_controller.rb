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
        flash[:danger] = "Something went wrong when trying to sign you up.  Perhaps your password was lame.  Perhaps your e-mail wasnn't an e-mail.  Figure it out."
        redirect_to root_path
        end
      else
        flash[:danger] = 'Deja Vu: That e-mail address looks familiar.'
        redirect_to root_path
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
    @events = Event.all
    @groups = Group.all
  end

  def update
    group_id = params[:groupId]
    members = params[:members] ? params[:members] : []
    admins = params[:admins] ? params[:admins] : []
    deletions = params[:deletions]
    edit_user = params[:user]
    user_id = params[:id]
    if deletions
      deletions.each do |id|
        deleted_user = User.find(id)
        Group.find(group_id).memberships.find_by_user_id(deleted_user.id).delete
      end
    elsif members && admins
      members.each do |id|
        member = User.find(id)
        member.memberships.find_by_group_id(group_id).update(admin: false)
        member.save
      end
      admins.each do |id|
        admin = User.find(id)
        admin.memberships.find_by_group_id(group_id).update(admin:true)
        admin.save
      end
    end
    if edit_user
      @user = User.find(user_id)


      if edit_user[:picture] != nil
        # p "unless ******************"
        uploaded_file = edit_user[:picture].path
        cloudinary_file = Cloudinary::Uploader.upload(uploaded_file)
        cloudinary_file = cloudinary_file["public_id"];
        @user.update(firstname: edit_user[:firstname], lastname: edit_user[:lastname], tel: edit_user[:tel], image: cloudinary_file)
        redirect_to user_groups_path(@user)
      elsif @user.image != nil
        @user.update(firstname: edit_user[:firstname], lastname: edit_user[:lastname], tel: edit_user[:tel])
        redirect_to user_groups_path(@user)
      else
        cloudinary_file = User.default_picture
        @user.update(firstname: edit_user[:firstname], lastname: edit_user[:lastname], tel: edit_user[:tel], image: cloudinary_file)
        @user.tel = edit_user[:tel]
        @user.active = edit_user[:active]
        @user.image = cloudinary_file
        @user.save
        redirect_to user_groups_path(@user)
      end
      return
    end
    render :plain => params
  end

  def edit
    render layout: false
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :tel, :password)
  end


end