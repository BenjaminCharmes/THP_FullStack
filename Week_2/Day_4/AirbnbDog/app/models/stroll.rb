class Stroll < ApplicationRecord
  has_many :dogsitters, dependent: :destroy
  has_many :stroll_dogs
  has_many :dogs, through: :stroll_dogs, dependent: :destroy
end