class AddLeastActivitiesTo < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :last_activity, :datetime
    add_column :posts, :last_comment_time, :datetime
  end
end
