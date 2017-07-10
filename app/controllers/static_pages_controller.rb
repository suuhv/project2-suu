class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @user = current_user
      @post = current_user.posts.build
      @feed_items = current_user.feed.order_by_desc.page(params[:page]).
        per Settings.user.per_page
    end
  end
end
