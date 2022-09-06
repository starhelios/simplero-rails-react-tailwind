class CreatePostAttachments < ActiveRecord::Migration[7.0]
  def change
    create_table :post_attachments do |t|
      t.string :path
      t.integer :order
      t.integer :post_id
      t.timestamps

      t.foreign_key :posts, column: :post_id
    end
  end
end
