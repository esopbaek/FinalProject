class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.user_id = current_user.id
    
    if @comment.save
      redirect_to dashboard_url
    else
      flash[:errors] = @comment.errors.full_messages
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to dashboard_url
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
