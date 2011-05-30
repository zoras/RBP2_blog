class PostsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]

  def index
    @posts = Post.all
    # show all posts that have more than 10 comments
    @popular_posts = Post.all.collect{|p| p if p.comments.size > 10}.compact

    respond_to do |format|
      format.html
      format.xml
    end
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html
      format.xml
    end
  end

  def create
    @post = Post.new(params[:post])

    if @post.title.present? && @post.text.present? && @post.save
      flash[:notice] = "Post has been created."
      redirect_to user_post_path(current_user,@post)
    else
      flash[:notice] = "Post has not been created."
      render :action => "new"
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.all

    respond_to do |format|
      format.html
      format.xml
    end
  end

end

