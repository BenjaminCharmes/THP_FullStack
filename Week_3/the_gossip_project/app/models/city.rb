class City < ApplicationRecord
  has_many :users
  has_many :gossips, through: :users
end