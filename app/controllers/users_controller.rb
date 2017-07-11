class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    @posts = @user.posts.order_by_desc.page(params[:page]).per Settings.user.per_page
    @post = current_user.posts.build

    return if @user
    render file: "public/404.html", layout: false
  end

  def index
    @users = User.select(:id, :avatar, :name, :email).order(:id).page(params[:page])
      .per Settings.user.per_page
  end

  def following
    @title = t ".following"
    @user = User.find_by id: params[:id]
    @users = @user.following.page(params[:page]).per Settings.user.per_page
    render "show_follow"
  end

  def followers
    @title = t ".followers"
    @user = User.find_by id: params[:id]
    @users = @user.followers.page(params[:page]).per Settings.user.per_page
    render "show_follow"
  end
end
