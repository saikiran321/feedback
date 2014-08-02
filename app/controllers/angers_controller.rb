class AngersController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @anger = Anger.new
    @anger.level = params[:i]
    @anger.post = @post
    @anger.user = current_user
    @anger.save
    respond_to do |format|
      format.html{ redirect_to @anger }
      format.js
    end
  end

  def update
    @anger = Anger.find(params[:id])
    @post = @anger.post
    @anger.update_attributes(level: params[:i])
    respond_to do |format|
      format.html {redirect_to @anger}
      format.js
    end
  end

end
