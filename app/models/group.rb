class Group < ApplicationRecord
    validates :name, presence: true, length: {minimum: 6, maximum: 100}
    validates :access_level, presence: true
    validates :owner_id, presence: true
end