class CommentsController < ApplicationController
  before_filter :login_required, :find_post

  def new
    @comment = @post.comments.new

    respond_to do |format|
      format.html
      format.xml
    end
  end

  def create
    @comment = @post.comments.build(params[:comment], :user_id => current_user.id)

    if @comment.save
      flash[:notice] = "Comment has been created."
      redirect_to user_post_path(current_user,@post)
    else
      flash[:notice] = "Comment has not been created."
      render :action => "new"
    end
  end

  private
    def find_post
      @post = Post.find(params[:post_id])
    end

end

