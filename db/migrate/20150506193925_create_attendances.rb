class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :event, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.boolean :yes
      t.boolean :no
      t.boolean :maybe
      t.integer :count

      t.timestamps null: false
    end
  end
end
