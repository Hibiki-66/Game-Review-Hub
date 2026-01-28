class Public::HomesController < ApplicationController
  def top
    @posts = Post.includes(:user).order(created_at: :desc).limit(3)
  end
end
