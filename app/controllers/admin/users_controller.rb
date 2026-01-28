class Admin::UsersController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  # ユーザー一覧
  def index
    @users = User.all
  end
  
  
  # ユーザー詳細
  def show
    @user = User.find(params[:id])
  end
  
  
  # 退会（削除）
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: 'ユーザーを削除しました。'
  end
end
