class AddDayToEvent < ActiveRecord::Migration
  def change
    add_column :events, :day, :integer
  end
end
