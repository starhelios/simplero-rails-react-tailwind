class GroupMember < ApplicationRecord
	validates :joining_date, presence: true
	validates :group_id, presence: true
	validates :user_id, presence: true

	belongs_to :group, class_name: "Group"
	belongs_to :user, class_name: "User"
end