class CommentsController < ApplicationController
  def new
    @comment = Post.find(params[:id]).comments.build
  end

  def create
    post = Post.find(params[:post_id])
    if user_signed_in?
      @comment = post.comments.build(body: comment_params[:comment_body], user: current_user)
    else
      @comment = post.comments.build(body: comment_params[:comment_body])
    end

    if @comment.save
      redirect_to post_path(post), notice: I18n.t("controller.created", data: I18n.t("comment.single"))
    else
      redirect_to post_path(post), status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to post_path(params[:post_id]), notice: I18n.t("controller.deleted", data: I18n.t("comment.single"))
  end

  private
    def comment_params
      params.require(:comment).permit(:comment_body)
    end
end
