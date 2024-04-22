class Post < ApplicationRecord
  paginates_per 3

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: { message: "Title cannot be blank" }, length: { maximum: 150, message: "Title cannot exceed 150 characters" }
  validates :body, presence: { message: "Text cannot be blank" }
end
