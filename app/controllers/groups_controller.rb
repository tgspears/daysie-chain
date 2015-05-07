class GroupsController < ApplicationController

  def index
    @user = current_user
    @group = Group.new
    @event = Event.new
  end

  def create
    user = current_user
    group = Group.create(:name => params[:group][:name], :size => params[:group][:size], :status => params[:group][:status])
    user.groups << group
    event = Event.create(:name => params[:event][:name], :desc => params[:event][:desc], :max => params[:event][:max], :loc => params[:event][:loc], :date => params[:event][:date], :time => params[:event][:time])
    user.groups.find(group.id).events << event
    membership = user.memberships.create()
    membership.group_id = group.id
    membership.user_id = user.id
    membership.admin = true
    membership.save

    redirect_to user_groups_path(@current_user.id)
  end

end

