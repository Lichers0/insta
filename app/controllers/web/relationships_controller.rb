# typed: true
class Web::RelationshipsController < ApplicationController
  def create
    current_user.follow_user(params[:user_id])
  end

  def destroy
    current_user.unfollow_user(params[:id])
  end
end
