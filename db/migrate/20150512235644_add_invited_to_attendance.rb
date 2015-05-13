class AddInvitedToAttendance < ActiveRecord::Migration
  def change
    add_column :attendances, :invited, :boolean
  end
end
