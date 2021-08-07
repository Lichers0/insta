class Web::Users::CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params.merge(user: current_user, post: post))
    if @comment.save
      redirect_to @post
    else
      render "web/users/posts/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def post
    @post ||= Post.find(params[:post_id])
  end
end
