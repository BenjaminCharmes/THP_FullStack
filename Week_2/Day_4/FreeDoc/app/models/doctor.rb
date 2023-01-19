class Doctor < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
  belongs_to :city
  has_many :doctor_specialties, dependent: :destroy
  has_many :specialties, through: :doctor_specialties
end
