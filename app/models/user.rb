class User < ApplicationRecord
  before_save { self.email = email.downcase }
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  # validates :email, presence: true, length: { maximum: 255 },
  #                   format: { with: VALID_EMAIL_REGEX }
  has_secure_password

  has_many :memos, dependent: :destroy
  has_many :goodwills
  has_many :likes, through: :goodwills, source: :like
  has_many :reverses_of_goodwill, class_name: 'Goodwill', foreign_key: 'like_id'
  has_many :likers, through: :reverses_of_goodwill, source: :user

  def like(other_memo)
    self.goodwills.find_or_create_by(like_id: other_memo.id)
  end

  def unlike(other_memo)
    goodwill = self.goodwills.find_by(like_id: other_memo.id)
    goodwill.destroy if goodwill
  end

  def liking?(other_memo)
    self.likes.include?(other_memo)
  end
end
