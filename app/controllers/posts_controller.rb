class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc).page params[:page]
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @post.comments.build
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
