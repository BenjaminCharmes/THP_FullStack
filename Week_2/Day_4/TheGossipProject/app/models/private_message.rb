class PrivateMessage < ApplicationRecord
  belongs_to :sender, class_name: "User"
  has_many :recipients
  has_many :users, through: :recipients
end
