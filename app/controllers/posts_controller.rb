class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def show
  end

  def create
      @post = Post.new(post_params)

      if @post.save
          render 'api/posts/show'
      else
          render json: { status: false, message: 'Unable to create post', errors: @post.errors.full_messages }
      end
  end

  def update
      if @post.update(post_params)
          render 'api/posts/show'
      else
          render json: { status: false, message: 'Unable to update post', errors: @post.errors.full_messages }
      end
  end

  def destroy
      @post.destroy
      render json: { status: true, message: 'Post Deleted!' }
  end

  private 

  def set_post
      @post = Post.find(params[:id])
  end

  def post_params
      params.require(:post).permit(:title, :description, :author_id, :group_id)
  end

end