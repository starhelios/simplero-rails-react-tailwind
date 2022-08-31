class User < ApplicationRecord
    validates :name, presence: true, length: {minimum: 3, maximum:25}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255},
        uniqueness: {case_senstive: false}, format: {with: VALID_EMAIL_REGEX}

    before_save {self.email = email.downcase}

    has_secure_password
end