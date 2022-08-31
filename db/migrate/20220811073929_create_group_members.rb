class CreateGroupMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :group_members do |t|
      t.integer :group_id
      t.integer :user_id
      t.datetime :joining_date

      t.foreign_key :users, column: :user_id
      t.foreign_key :groups, column: :group_id
    end
  end
end
