class Admin::PostsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  # 投稿一覧
  def index
    @posts = Post.all
  end
  
  # 投稿詳細
  def show
    @post = Post.find(params[:id])
  end
  
  # 投稿削除
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_posts_path, notice: "投稿を削除しました"
  end
  
end
