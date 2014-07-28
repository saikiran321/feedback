class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where("post_id = ?", params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.content = params[:post][:content]
    @post.tag_ids = params[:post][:tag_ids]
    if params[:post][:file_link]
      uploaded_io = params[:post][:file_link]
      File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      @post.file_link = uploaded_io.original_filename
    end

    @post.user = current_user
    if @post.save
      flash[:success] = "Successfully lodged a complaint"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    if current_user.id != User.find(Post.find(params[:id]).user_id).id
      @notif = Notification.new
      @notif.user_id = User.find(Post.find(params[:id]).user_id).id
      @notif.post_id = Integer(params[:id])
      @notif.notif_user = current_user.id
      @notif.action = "deleted your post with title '#{Post.find(params[:id]).title}'"
      @notif.save
    end
    Post.find(params[:id]).destroy
    flash[:success] = "Succesfully deleted the post"
    redirect_to :back
  end

  def get_file
    send_file "/public/uploads/#{Post.find(params[:post_id]).file_link}", type: 'image/jpeg', disposition: 'inline' 
  end

  def update
    @post = Post.find(params[:id])
    @post.solved = true
    if @post.save
      if  current_user.id != User.find(Post.find(params[:id]).user_id).id
        @notif = Notification.new
        @notif.user_id = User.find(Post.find(params[:id]).user_id).id
        @notif.post_id = Integer(params[:id])
        @notif.notif_user = current_user.id
        @notif.action = "marked your post as solved"
        @notif.save
      end
      flash[:success] = "Successfully marked the status of the post as solved."
      redirect_to :back
    else
      flash[:error] = "Could not save the status of the post. Please try again."
    end
  end

end
