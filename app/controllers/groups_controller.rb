class GroupsController < ApplicationController

  def index
    if current_user
      @user = current_user
      @group = Group.new
      @event = Event.new
      unless @user.groups.empty?
        @groups = @user.groups
        puts @groups
      end
    else
      redirect_to root_path
    end
  end

  def create
      # render :plain => params
    user = current_user
    if params[:group][:size].to_i.is_a? Integer
        unless params[:group][:image] == nil
          uploaded_file = params[:group][:image].path
        else
          uploaded_file = "#{Rails.root}/app/assets/images/daysie-chain-logo.png"
        end
        cloudinary_file = Cloudinary::Uploader.upload(uploaded_file)
        cloudinary_file = cloudinary_file["public_id"];
      group = Group.create(:name => params[:group][:name], :size => params[:group][:size].to_i, :status => params[:group][:status], :image => cloudinary_file)
      if group
        user.groups << group
        event = Event.create(:name => params[:event][:name], :desc => params[:event][:desc], :max => params[:event][:max], :loc => params[:event][:loc], :date => params[:event][:date], :time => params[:event][:time])
        user.groups.find(group.id).events << event
        user.memberships << group.memberships.create(admin:true)
      else
        flash[:danger] = "Please complete fill out all required fields"
      end
    else
      flash[:danger] = "Please enter a valid size"
    end
    redirect_to user_groups_path(@current_user.id)
  end

  def show
    @user = current_user
    @group = current_user.memberships.find_by_group_id(params[:id]).group
    @members = @group.memberships
    render layout: false
  end

end

