class Goodwill < ApplicationRecord
  belongs_to :user
  belongs_to :memo, class_name: 'Memo'
end
