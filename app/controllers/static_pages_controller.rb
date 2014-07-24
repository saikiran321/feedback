class StaticPagesController < ApplicationController

  def home
    @posts = Post.all.reverse_order
  end

  def about
  end

  def contact
  end
end
