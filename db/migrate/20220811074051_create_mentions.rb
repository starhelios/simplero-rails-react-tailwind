class CreateMentions < ActiveRecord::Migration[7.0]
  def change
    create_table :mentions do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :comment_id

      t.timestamps
      t.foreign_key :users, column: :user_id
      t.foreign_key :posts, column: :post_id
      t.foreign_key :comments, column: :comment_id
    end
  end
end
