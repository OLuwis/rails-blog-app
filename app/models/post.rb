class Post < ApplicationRecord
  paginates_per 3

  has_many :comments, dependent: :destroy

  validates :title, presence: { message: "Title cannot be blank" }, length: { maximum: 150, message: "Title cannot exceed 150 characters" }
  validates :body, presence: { message: "Text cannot be blank" }
end
