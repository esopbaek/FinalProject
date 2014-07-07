class Api::PostsController < ApplicationController
  def index
    @posts = Post.where("user_id = ?", current_user.id)
    render "index"
  end
  
  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comments = @post.comments
    render "show"
  end
  
  def create
    @post = current_user.posts.new(post_params)
    
    if @post.save
      head :ok
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
