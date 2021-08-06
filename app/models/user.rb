# typed: true
class User < ApplicationRecord
  devise :database_authenticatable, :registerable

  has_many :posts, dependent: :destroy
  has_many :relationships_as_follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :targets, through: :relationships_as_follower
  has_many :relationships_as_target, class_name: "Relationship", foreign_key: "target_id", dependent: :destroy
  has_many :followers, through: :relationships_as_target

  def follow_user(user_id)
    relationships_as_follower.create(target_id: user_id)
  end

  def unfollow_user(user_id)
    relationships_as_follower.find_by(target_id: user_id).destroy
  end

  def follow?(user)
    !!relationships_as_follower.find_by(target: user)
  end
end
