class AddMinToEvent < ActiveRecord::Migration
  def change
    add_column :events, :min, :integer
  end
end
