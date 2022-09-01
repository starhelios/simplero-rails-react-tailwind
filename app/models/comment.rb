class Comment < ApplicationRecord

  validates :description, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :reply_to, presence: false

  belongs_to :user
  belongs_to :post

  belongs_to :reply_to_comment,  class_name: "Comment", foreign_key: :reply_to, optional: true
  has_many   :replies, class_name: "Comment", foreign_key: :reply_to, dependent: :destroy
end
