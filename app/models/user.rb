class User < ApplicationRecord
  before_save { self.email = email.downcase }
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  # validates :email, presence: true, length: { maximum: 255 },
  #                   format: { with: VALID_EMAIL_REGEX }
  has_secure_password

  has_many :memos, dependent: :destroy
  has_many :favorites
  has_many :likes, through: :favorites, source: :like
  has_many :reverses_of_favorite, class_name: 'Favorite', foreign_key: 'like_id'
  has_many :likers, through: :reverses_of_favorite, source: :user

  def like(other_memo)
    unless self == other_memo
      self.favorites.find_or_create_by(like_id: other_memo.id)
    end
  end

  def unlike(other_memo)
    favorite = self.favorites.find_by(like_id: other_memo.id)
    favorite.destroy if favorite
  end

  def liking?(other_memo)
    self.likes.include?(other_memo)
  end
end
