class PostsController < ApplicationController

  def home
    #storing last 10 posts into the instance variable so that they can be displayed in views as required.
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
