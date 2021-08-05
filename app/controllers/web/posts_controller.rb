class Web::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      # redirect_to @post, notice: "Post created."
      render :new, notice: "Post created."
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:body, :image)
  end
end
