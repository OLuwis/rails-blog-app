class CommentsController < ApplicationController
  def new
    @comment = Post.find(params[:id]).comments.build
  end

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.build(body: comment_params[:comment_body], user: current_user)

    if @comment.save
      redirect_to post_path(post), notice: "Comment was successfully created"
    else
      redirect_to post_path(post), status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to post_path(params[:post_id]), notice: "Comment was successfully deleted"
  end

  private
    def comment_params
      params.require(:comment).permit(:comment_body)
    end
end
