class Api::CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    # @comment.post_id = params[:post_id]
    # @comment.user_id = current_user.id
    if @comment.save
      render "show"
    else
      flash[:errors] = @comment.errors.full_messages
    end
  end
  
  def index
    @comments = Comment.where("post_id = ?", params[:post_id])
    render "index"
  end

  def show
    @comment = Comment.find(params[:id])
    render "show"
  end  
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render json: {}
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment, :user_id, :commenter_id, :commenter_name, :post_id)
  end
end
