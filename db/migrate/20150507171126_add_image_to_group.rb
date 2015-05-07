class AddImageToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :image, :text
  end
end
