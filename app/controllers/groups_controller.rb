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
    user = current_user
    group = Group.create(:name => params[:group][:name], :size => params[:group][:size], :status => params[:group][:status])
    user.groups << group
    event = Event.create(:name => params[:event][:name], :desc => params[:event][:desc], :max => params[:event][:max], :loc => params[:event][:loc], :date => params[:event][:date], :time => params[:event][:time])
    user.groups.find(group.id).events << event
    user.memberships << group.memberships.create(admin:true)
    redirect_to user_groups_path(@current_user.id)
  end

  def show
    @user = current_user
    @group = current_user.memberships.find_by_group_id(params[:id]).group
    @members = @group.memberships
    render layout: false
  end

end

