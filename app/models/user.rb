class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
    uniqueness: {case_senstive: false}, format: {with: VALID_EMAIL_REGEX}

  before_save { self.email = email.downcase }

  has_many :groups_member, class_name: "GroupMember"
  has_many :groups, through: :groups_member
  has_many :groups_owner, class_name: "Group", foreign_key: "owner_id"

  def generate_jwt
    JWT.encode({id: id,
      exp: 60.days.from_now.to_i},
      Rails.application.secrets.secret_key_base)
  end
end
