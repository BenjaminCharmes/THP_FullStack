class StripeId
  @@event_id = 0

  def store(event_id)
    @@event_id = event_id
  end

  def create(customer)
    Attendance.create(stripe_customer_id: customer, event_id: @@event_id, user_id: customer)
  end
end