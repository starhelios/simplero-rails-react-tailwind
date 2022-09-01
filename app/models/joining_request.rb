class JoiningRequest < ApplicationRecord
    validates :status, presence: true
    validates :group_id, presence: true
    validates :user_id, presence: true
end