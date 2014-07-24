class StaticPagesController < ApplicationController

  def home
    @posts=Post.last(2)
  end

  def about
  end

  def contact
  end
end
