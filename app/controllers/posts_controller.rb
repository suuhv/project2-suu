class PostsController < ApplicationController
  before_action :correct_user, only: :destroy
  before_action :find_post, only: [:show, :edit, :update]
  # before_action :authenticate_user!

  def index
    @posts = Post.search(params[:q]).order(:title).page(params[:page])
      .per Settings.user.per_page
  end

  def create
    @post = current_user.posts.build post_params
    if @post.save
      flash[:success] = t ".created"
      redirect_to root_url
    else
      @feed_items = []
      render "static_pages/home"
    end
  end

  def show
  end

  def destroy
    @post.destroy
    flash[:success] = t ".delete"
    redirect_to request.referrer || root_url
  end

  def edit
  end

  def update
    if @post.update_attributes post_params
      flash[:success] = t ".update_post"
      redirect_to @post
    else
      flash.now[:danger] = t ".update_fail"
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit :title, :content, :picture, :all_tags
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end

  def find_post
    @post = Post.find_by id: params[:id]
  end
end
