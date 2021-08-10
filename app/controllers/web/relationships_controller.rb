# typed: true
class Web::RelationshipsController < ApplicationController
  def create
    current_user.follow_user(params[:user_id])
    redirect_to users_path
  end

  def destroy
    current_user.unfollow_user(params[:id])
    redirect_to users_path
  end
end
