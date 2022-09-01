class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :access_level
      t.string :uuid
      t.integer :owner_id
      t.string :last_activity
      t.timestamps
      t.foreign_key :users, column: :owner_id

    end
  end
end
