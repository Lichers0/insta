class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :body, presence: true
  validates_length_of :body, minimum: 5, too_short: "please enter at least 5 characters"
end
