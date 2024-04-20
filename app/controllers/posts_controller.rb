class PostsController < ApplicationController
  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      @posts = user.posts.order(created_at: :desc).page params[:page]
    else
      @posts = Post.order(created_at: :desc).page params[:page]
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(title: post_params[:title], body: post_params[:body])
    extract_tags(post_params[:tag])

    if @post.save
      redirect_to root_path, notice: "Post was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to post_path(@post), notice: "Post was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

    redirect_to root_path, notice: "Post was successfully deleted"
  end

  private
    def extract_tags(tags)
      tags.split(",").each do |tag|
        @post.tags << Tag.find_or_create_by(name: tag.downcase!.strip)
      end
    end

    def post_params
      params.require(:post).permit(:title, :body, :tag)
    end
end
