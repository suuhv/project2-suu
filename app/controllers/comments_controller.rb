class CommentsController < ApplicationController
  before_action :find_post, only: [:create, :edit, :update]
  before_action :find_comment, only: [:destroy, :edit, :udate]

  def create
    @comment = @post.comments.build comment_params
    @comment.user_id = current_user.id

    if @comment.save
      render json: {status: :success, html: render_to_string(@comment)}
    else
      render json: {status: :error, error: "false"}
    end
  end

  def edit
  end

  def update
    if @comment.update comments_params
      redirect_to root_url
    else
      render :edit
    end
  end

  def destroy
    if @comment.destroy
      render json: {status: :success,html: render_to_string(@comment)}
    end
  end

  private

  def find_post
    @post = Post.find_by id: params[:post_id]
  end

  def comment_params
    params[:comment].permit(:content)
  end

  def find_comment
    @post = Post.find_by id: params[:post_id]
    @comment = @post.comments.find_by id: params[:id]
  end
end
