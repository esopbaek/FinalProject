class Api::PostsController < ApplicationController
  def index
    @posts = Post.where("user_id = ?", current_user.id)
    render "index"
  end
  
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    render "show"
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    
    if @post.save
      redirect_to dashboard_url
    else
      flash[:errors] = @post.errors.full_messages
      #some crazy shit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

  end
  
  private
  def post_params
    params.require(:post).permit(:content)
  end
end
