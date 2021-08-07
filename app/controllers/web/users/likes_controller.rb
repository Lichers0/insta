# frozen_string_literal: true

class Web::Users::LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    post.likes.create(user: current_user)
    redirect_to post
  end

  def destroy
    post = Post.find(params[:id])
    post.likes.where(user: current_user).first.destroy
    redirect_to post
  end
end
