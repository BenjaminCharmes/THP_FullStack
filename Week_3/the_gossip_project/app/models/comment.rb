class Comment < ApplicationRecord
  validates :content,
    presence: true,
    length: { minimum: 2 }

  belongs_to :user
  has_many :likes, as: :likeable
end