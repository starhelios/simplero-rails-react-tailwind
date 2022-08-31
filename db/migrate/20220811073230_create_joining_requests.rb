class CreateJoiningRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :joining_requests do |t|
      t.string :status
      t.integer :user_id
      t.integer :group_id

      t.timestamps

      t.foreign_key :users, column: :user_id
      t.foreign_key :groups, column: :group_id

    end
  end
end
