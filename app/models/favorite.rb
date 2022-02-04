class Goodwill < ApplicationRecord
  belongs_to :user
  belongs_to :like, class_name: 'Memo'
end
