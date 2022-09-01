class GroupMember < ApplicationRecord
    validates :joining_date, presence: true
    validates :group_id, presence: true
    validates :user_id, presence: true
end