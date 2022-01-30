class User < ApplicationRecord
  has_many :memos, dependent: :destroy
  before_save { self.email = email.downcase }
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  # validates :email, presence: true, length: { maximum: 255 },
  #                   format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end
