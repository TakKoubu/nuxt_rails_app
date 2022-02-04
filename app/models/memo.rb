class Memo < ApplicationRecord
  belongs_to :user
  has_many :goodwills, class_name: 'Goodwill', foreign_key: 'like_id'
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  def goodwill_count 
    self.goodwills.count
  end
end
