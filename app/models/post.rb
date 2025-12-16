class Post < ApplicationRecord
  belongs_to :user

  has_many :post_comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy

  validates :review_title, presence: true
  validates :game_title, presence: true
  validates :body, presence: true
end
