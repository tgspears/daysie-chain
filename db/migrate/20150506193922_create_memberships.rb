class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :group, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.boolean :admin
      t.boolean :block

      t.timestamps null: false
    end
  end
end
