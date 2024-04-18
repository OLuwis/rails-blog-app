class Post < ApplicationRecord
  paginates_per 3

  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true
end
