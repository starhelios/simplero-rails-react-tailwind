class Post < ApplicationRecord

  validates :title, presence: true
  validates :description, presence: true
  validates :author_id, presence: true
  validates :group_id, presence: true

  belongs_to :user, foreign_key: "author_id"
  belongs_to :group

  has_many :comments

end
