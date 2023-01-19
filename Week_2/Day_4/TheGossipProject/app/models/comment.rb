class Comment < ApplicationRecord
  belongs_to :gossip
  belongs_to :user
  has_many :comment_likes
end