class Recipient < ApplicationRecord
  belongs_to :recipient, class_name: "User"
  has_many :private_message
end
