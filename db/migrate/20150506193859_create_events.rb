class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :desc
      t.string :max
      t.string :loc
      t.string :date
      t.string :time
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
