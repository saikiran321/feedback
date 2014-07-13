class PostsController < ApplicationController

  def home
    @post = Post.where("id = ?", params[:id])
    @comments = Comment.where("post_id = ?", params[:id])
  end

  def new
  end

  def create
  end

  def destroy
  end

  def update
  end
end
