class CommentsController < ApplicationController

  include ApplicationHelper

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    @comment.content = params[:comment][:content]
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    tag_it @comment
    if @comment.save
      if current_user.id != User.find(Post.find(params[:post_id]).user_id).id
        @notif = Notification.new
        @notif.user_id = User.find(Post.find(params[:post_id]).user_id).id
        @notif.post_id = @post.id
        @notif.notif_user = current_user.id
        @notif.action = 'commented on your post'
        @notif.save
      end
      @users = User.find(Comment.where("post_id = ?", @post.id).uniq.pluck(:user_id))
      @users.each do |user|
        if  current_user.id != user.id && user.id != User.find(@post.user_id).id
          @notif = Notification.new
          @notif.user_id = user.id
          @notif.post_id = @post.id
          @notif.notif_user = current_user.id
          @notif.action = 'commented on a post that you have commented on'
          @notif.save
        end
      end
      respond_to do |format|
        format.html {redirect_to @comment}
        format.js
      end
    else
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user.id != User.find(@comment.user_id).id
      @notif = Notification.new
      @notif.user_id = User.find(@comment.user_id).id
      @notif.post_id = Post.find(@comment.post_id).id
      @notif.notif_user = current_user.id
      @notif.action = 'deleted your comment on a post'
      @notif.save
    end
    @post = Post.find(@comment.post_id)
    respond_to do |format|
      format.html {redirect_to @comment}
      format.js
    end
  end

end
