class Event < ApplicationRecord

  validates :start_date,
    presence: true,
    comparison: { greater_than: DateTime.now }

  validates :duration,
    presence: true,
    numericality: { greater_than: 0 }

  validates :title,
    presence: true,
    length: { :in => 5..140 }
  
  validates :description,
    presence: true,
    length: { :in => 20..1000 }

  validates :price,
    presence: true,
    numericality: { only_integer: true, :in => 1..1000 }

  validates :location,
    presence: true

  belongs_to :admin, foreign_key: 'admin_id', class_name: 'User'

  has_many :attendances
  has_many :users, through: :attendances

  def end_date
    start_date + duration.minutes
  end

  private

  def duration_must_be_a_multiple_of_5
    unless (duration % 5) == 0
      errors.add(:duration, "La durée de l'événement doit être un multiple de 5 !")
    end
  end

end
