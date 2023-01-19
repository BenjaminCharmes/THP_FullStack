class Reservation < ApplicationRecord
  before_validation :overlaping_reservation?

  validates :start_date,
    presence: true

  validates :end_date,
    presence: true

  validates_comparison_of :end_date, 
    greater_than: :start_date

  def duration
    puts "Duration: #{(self.end_date.to_i - self.start_date.to_i)/60/60/24} day(s)."
    return (self.end_date.to_i - self.start_date.to_i)/60/60/24
  end

  belongs_to :guest, class_name: "User"
  belongs_to :listing

  def overlaping_reservation?
    self.listing.reservations.each do |booking|
      if self.start_date < booking.end_date && self.end_date > booking.start_date
        return errors.add(:start_date, "This period has already been booked!")
      end
    end
  end

end