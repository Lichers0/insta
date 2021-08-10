class Web::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      render json: { link: post_path(@post) }
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:body, :image)
  end
end
