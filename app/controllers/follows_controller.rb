class FollowsController < ApplicationController

  def create
    @post = Post.find(params[:follow][:post_id])
    @post.follow!(current_user)
    respond_to do |format|
      format.html {redirect_to @post}
      format.js
    end
  end

  def destroy
    @post = Post.find(params[:follow][:post_id])
    @post.unfollow!(current_user)
    respond_to do |format|
      format.html {redirect_to @post}
      format.js
    end
  end
end
