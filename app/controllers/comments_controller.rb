class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.create(body: comment_params[:comment_body])

    if @comment.save
      redirect_to post_path(post)
    else
      redirect_to post_path(post)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:comment_body)
    end
end
