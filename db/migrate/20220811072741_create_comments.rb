class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :description
      t.string :attachment_path
      t.integer :user_id
      t.integer :post_id
      t.integer :reply_to

      t.timestamps
      t.foreign_key :users, column: :user_id
      t.foreign_key :posts, column: :post_id
    end
  end
end
