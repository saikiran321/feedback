class CommentsController < ApplicationController

  def create
    @comment = Comment.new
    @comment.content = params[:comment][:content]
    @comment.user_id = current_user.id
    @comment.post_id = Integer(params[:post_id])
    if @comment.save
      if current_user.id != User.find(Post.find(params[:post_id]).user_id).id
        @notif = Notification.new
        @notif.user_id = User.find(Post.find(params[:post_id]).user_id).id
        @notif.post_id = Integer(params[:post_id])
        @notif.notif_user = current_user.id
        @notif.action = 'commented on your post'
        @notif.save
      end
      @comments = Comment.where("post_id = ?", Post.find(params[:post_id])).uniq.pluck(:user_id)
      @comments.each do |comment|
        if ( current_user.id != User.find(comment.user_id).id && User.find(comment.user_id).id != User.find(Post.find(params[:post_id]).user_id).id)
          @notif = Notification.new
          @notif.user_id = User.find(comment.user_id).id
          @notif.post_id = Integer(params[:post_id])
          @notif.notif_user = current_user.id
          @notif.action = 'commented on a post that you have commented'
          @notif.save
        end
      end
      flash[:success]="Commented successfully"
      redirect_to :back
    else
      render 'new'
    end
  end

  def destroy
    if current_user.id != User.find(Comment.find(params[:id]).user_id).id
      @notif = Notification.new
      @notif.user_id = User.find(Comment.find(params[:id]).user_id).id
      @notif.post_id = Post.find(Comment.find(params[:id]).post_id).id
      @notif.notif_user = current_user.id
      @notif.action = 'deleted your comment on a post'
      @notif.save
    end
    Comment.find(params[:id]).destroy
    flash[:success]="Successfully deleted the comment"
    redirect_to :back
  end

end
