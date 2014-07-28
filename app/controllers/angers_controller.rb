class AngersController < ApplicationController

  def create
    @post = Post.find_by_url_token(params[:anger][:post_id])
    @anger = Anger.new
    @anger.level = params[:anger][:level]
    @anger.post = @post
    @anger.user = my_current_user
    @anger.save
    respond_to_angers
  end

  def destroy
    @anger = Anger.find(params[:id])
    @post = @anger.post
    if !my_current_user?(@anger.user)
      sign_out
      redirect_to root_path
    else
      @anger.destroy
      respond_to_angers
    end
  end

  private
  def respond_to_angers
    respond_to do |format|
      format.html {redirect_to @post}
      format.js
    end
  end
end
