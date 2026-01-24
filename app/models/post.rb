class Post < ApplicationRecord
  belongs_to :user

  has_many :post_comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :review_title, presence: true
  validates :game_title, presence: true
  validates :body, presence: true

  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("game_title LIKE?","#{word}")
    elsif search == "forward_match"
      @post = Post.where("game_title LIKE?","#{word}%")
    elsif search == "backward_match"
      @post = Post.where("game_title LIKE?","%#{word}")
    elsif search == "partial_match"
      @post = Post.where("game_title LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
