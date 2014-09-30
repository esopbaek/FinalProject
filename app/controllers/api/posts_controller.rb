class Api::PostsController < ApplicationController
  wrap_parameters false
  
  def index
    @user = current_user
    @posts = Post.all
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
    @user = @post.user
    @comments = @post.comments
    if @post.save
      render "show"
    else
      flash[:errors] = @post.errors.full_messages
      #some crazy shit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    render json: {}
  end
  
  private
  def post_params
    params.require(:post).permit(:content, :post_id)
  end
end
