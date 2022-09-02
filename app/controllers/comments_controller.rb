class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  def show
  end

  def create
    @comment = Comment.create(comment_params)
    @comment.post.update_last_comment_time
    redirect_to post_path(@comment.post_id)
  end

  def update
    @comment.update(comment_params)
    redirect_to post_path(@comment.post_id)
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@comment.post)
  end

  private 

  def set_comment
      @comment = Comment.find(params[:id])
  end

  def comment_params
      params.require(:comment).permit(:description, :attachment_path, :user_id, :post_id, :reply_to)
  end

end