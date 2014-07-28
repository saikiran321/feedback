class TagsController < ApplicationController

  def index
    @posts = Post.all.reverse_order
  end

  def show
    @tag = Tag.find(params[:id])
    @posts = Tag.includes(:posts).find(@tag.id).posts
  end

end
