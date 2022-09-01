class Api::CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  def show
  end

  def create
      @comment = Comment.new(comment_params)

      if @comment.save
          render 'api/comments/show'
      else
          render json: { status: false, message: 'Unable to create comment', errors: @comment.errors.full_messages }
      end
  end

  def update
      if @comment.update(comment_params)
          render 'api/comments/show'
      else
          render json: { status: false, message: 'Unable to update comment', errors: @comment.errors.full_messages }
      end
  end

  def destroy
      @comment.destroy
      render json: { status: true, message: 'Comment Deleted!' }
  end

  private 

  def set_comment
      @comment = Comment.find(params[:id])
  end

  def comment_params
      params.require(:comment).permit(:description, :attachment_path, :user_id, :post_id, :reply_to)
  end

end