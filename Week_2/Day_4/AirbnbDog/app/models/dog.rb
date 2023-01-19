class Dog < ApplicationRecord
  belongs_to :city
  has_many :stroll_dogs, dependent: :destroy
  has_many :strolls, through: :stroll_dogs, dependent: :destroy
  has_many :dogsitters, through: :strolls, dependent: :destroy
end