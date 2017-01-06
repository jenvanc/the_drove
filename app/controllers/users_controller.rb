class UsersController < ApplicationController
  def index
    @display_users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    @posts = Post.find_user_wall_posts(current_user)
  end

end
