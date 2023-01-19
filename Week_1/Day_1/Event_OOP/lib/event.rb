class Event
  attr_accessor :start_date, :duration, :title, :attendees

  def initialize(start_date_to_update, duration_to_update, title_to_update, attendees_to_update)
    @start_date = Time.parse(start_date_to_update)
    @duration = duration_to_update
    @title = title_to_update
    @attendees = attendees_to_update
  end

  def postpone_24h # Delay by 24 hours
    @start_date += 24*60*60
  end 

  def end_date # Tell event's end date
    @end_date = @start_date + @duration * 60
    puts "The end time of the event is: #{@end_date.strftime("%H:%M")}."
  end

  def is_past? # Tell if event is past
    if @start_date > Time.now || @start_date == Time.now
      puts "The event has not passed !"
    elsif @start_date < Time.now
      puts "The event has passed !"
    end
    # return @start_date < Time.now
  end

  def is_future? # Tell if event is in the future
    if @start_date < Time.now || @start_date == Time.now
      puts "The event is not in the future !"
    elsif @start_date > Time.now
      puts "The event is in the future !"
    end
    # !self.is_past?
  end 

  def is_soon? # Tell if the even is in less than 30 minutes
    if (@start_date - Time.now).abs <= 30 * 60
      puts "The event is coming soon !"
    else
      puts "The event is not coming soon !"
    end 
    # return @start_date < Time.now + 60*30
  end

  def to_s # Tell everything about the event
    puts "> Titre: #{@title}"
    puts "> Date de début: #{@start_date}"
    puts "> Durée: #{@duration} minutes"
    puts "> Invité(e)s: #{@attendees}"
    # print ">Invités :"
    # puts @attendees.join(", ")
  end

end 