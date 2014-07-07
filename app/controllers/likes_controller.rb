class LikesController < ApplicationController
  def create
    @like = Like.new
    
    if params[:comment_id]
      @comment = Comment.find(params[:comment_id])
      @like = @comment.likes.new(likeable_id: params[:comment_id], likeable_type: "comment", user_id: current_user.id )
    elsif params[:post_id]
      @post = Post.find(params[:post_id])
      @like = @post.likes.new(likeable_id: params[:post_id], likeable_type: "post", user_id: current_user.id )
    end
    
    if @like.save
      redirect_to dashboard_url
    else
      flash[:errors] = @like.errors.full_messages 
    end
  end
  
  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to dashboard_url
  end
end
