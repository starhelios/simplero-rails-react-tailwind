class Group < ApplicationRecord
    validates :name, presence: true, length: {minimum: 6, maximum: 100}
    validates :uuid, presence: true
    validates :access_level, inclusion: { in: ["public", "private", "secret"]}
    validates :owner_id, presence: true

    has_many :group_member, class_name: "GroupMember"
    has_many :users, through: :group_member

    belongs_to :owner, class_name: "User", foreign_key: "owner_id"

    has_many :posts
end
