class StaticPagesController < ApplicationController
  def home
    @tags=Tag.all
    @posts=Post.last(10)
  end

  def about
  end

  def contact
  end
end
