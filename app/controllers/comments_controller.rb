class CommentsController < ApplicationController
  before_filter :login_required

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build

    respond_to do |format|
      format.html
      format.xml
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params[:comment])
    @comment.post_id = @post.id
    @comment.user_id = current_user.id

    if @comment.is_minimum_length? && @comment.save
      flash[:notice] = "Comment has been created."
      redirect_to user_post_path(current_user,@post)
    else
      flash[:notice] = "Comment has not been created."
      render :action => "new"
    end
  end

end

