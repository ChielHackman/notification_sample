class PostsController < ApplicationController
  before_action :authenticate_user!, only:[:new]
  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
