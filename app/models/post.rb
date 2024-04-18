class Post < ApplicationRecord
  paginates_per 3

  validates :title, presence: true, length: { maximum: 150 }
  validates :body, presence: true
end
