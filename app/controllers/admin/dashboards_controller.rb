class Admin::DashboardsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  def index
    @users_count = User.count
    @posts_count = Post.count
  end
end
