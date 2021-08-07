# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_one_attached :image

  validates :image, presence: true

  def liked?(user)
    likes.where(user: user).any?
  end

  def likes_count
    likes.count
  end
end
