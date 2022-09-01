class JoiningRequest < ApplicationRecord
    validates :status, presence: true
    validates :group_id, presence: true
    validates :user_id, presence: true

    belongs_to :user, class_name: "User"
    belongs_to :group, class_name: "Group"
end