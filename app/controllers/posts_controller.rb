class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def show
    @is_admin = @post.group.owner_id === @current_user.id
  end

  def edit
    @group = @post.group
  end

  def create
    @post = Post.new(post_params)
    group = Group.find(post_params[:group_id])
    if @post.save
      group.update_last_activity
      redirect_to post_path(@post)
    else
      redirect_back fallback_location: group_path(group.id), flash: {errors: @post.errors.full_messages}
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      redirect_back fallback_location: edit_post_path(@post), flash: {errors: @post.errors.full_messages}
    end
  end

  def destroy
    group_uuid = @post.group.uuid
    @post.destroy
    redirect_to group_path(group_uuid)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :author_id, :group_id)
  end
end
