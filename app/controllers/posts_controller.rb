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
    Post.find(params[:id]).destroy
    flash[:success] = "Succesfully deleted the post"
    redirect_to :back
  end

  def edit
    @post = Post.find(params[:id])
    @comments = Comment.where("post_id = ?", params[:id])
  end

  def update
  end
end
