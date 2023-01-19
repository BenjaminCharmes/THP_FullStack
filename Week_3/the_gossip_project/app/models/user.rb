class User < ApplicationRecord

  has_secure_password

  validates :first_name,
    presence: true
  validates :last_name,
    presence: true
  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :age,
    presence: true
  validates :password,
    presence: true,
    length: { minimum: 6 }

  belongs_to :city

  has_many :gossips, dependent: :destroy
  has_many :sent_messages, foreign_key: 'sender_id', class_name: 'PrivateMessage'
  has_many :join_table_message_recipients
  has_many :received_messages, foreign_key: 'recipient_id', class_name: 'JoinTableMessageRecipient'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

end