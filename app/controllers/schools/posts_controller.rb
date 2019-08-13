class Schools::PostsController < ApplicationController

  def create
    @create_post = current_user.posts.build(post_params)
    if @create_post.save
      @error = "Created SUccessfully"
    else
      @error = @post.errors
    end
  end

  def like
    @post = Post.find_by(id: params[:post_id])
    like = @post.user_like(current_user)
    if like.present?
      current_user.post_likes.where(post_id: @post.id).destroy_all
    else
      current_user.post_likes.create(post_id: @post.id)
    end
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :description, :parent_id, post_images_attributes: [:image, :video, :audio])
  end
end
