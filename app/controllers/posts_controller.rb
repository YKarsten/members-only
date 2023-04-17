class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(allowed_post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = 'Great! Your post has been created!'
      redirect_to action: 'index' # go to show page for @post
    else
      flash.now[:error] = 'Rats! Fix your mistakes, please.'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def allowed_post_params
    params.require(:post).permit(:title, :body)
  end
end
