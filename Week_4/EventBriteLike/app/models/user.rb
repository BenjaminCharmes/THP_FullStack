class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :welcome_send

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  has_many :attendances
  has_many :events, through: :attendances

  has_many :administrated_events, foreign_key: 'admin_id', class_name: 'Event'

end
