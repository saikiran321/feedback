class PostsController < ApplicationController

  def home
    @post = Post.where("id = ?", params[:id])
    @comments = Comment.where("post_id = ?", params[:id])
  end

  def new
  end

  def create
    title = params[:post][:title]
    content = params[:post][:content]

    if title.length!= 0
      redirect_to root_url
    else
      redirect_to new_post_path
    end
  end

  def destroy
  end

  def edit
  end
end
