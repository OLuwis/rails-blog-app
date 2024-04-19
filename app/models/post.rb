class Post < ApplicationRecord
  paginates_per 3

  validates :title, presence: { message: "Title cannot be blank" }, length: { maximum: 150, message: "Title cannot exceed 150 characters" }
  validates :body, presence: { message: "Title cannot be blank" }
end
