class StaticPagesController < ApplicationController
  def home
    @posts=Post.last(10)
  end

  def about
  end

  def contact
  end
end
