class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]

    return if @user
    render file: "public/404.html", layout: false
  end

  def index
    @users = User.select(:id, :avatar, :name, :email).order(:id).page(params[:page])
      .per Settings.user.per_page
  end
end
