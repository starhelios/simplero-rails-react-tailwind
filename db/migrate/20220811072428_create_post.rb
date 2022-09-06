class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.integer :author_id
      t.integer :group_id
      t.datetime :last_comment_time
      t.timestamps
      t.foreign_key :users, column: :author_id
      t.foreign_key :groups, column: :group_id
    end
  end
end
