require_relative 'user'
require_relative 'event'

class EventCreator

  def get_title
    puts " "
    puts "Salut, tu veux créer un événement ? Cool !"
    puts "Commençons. Quel est le nom de l'événement ?"
    print "> "
    title = gets.chomp
    puts " "
    while title.length < 1
      puts "Le nom de ton événement doit contenir au moins 1 caractères."
      print "> "
      title = gets.chomp
      puts " "
    end
    return title
  end

  def get_start_date
    puts "Super. Quand aura-t-il lieu ?"
    puts "Merci d'utiliser le format suivant: YYYY-MM-JJ HH-MM"
    print "> "
    start_date = gets.chomp
    until start_date.length == 16
      puts "Merci d'utiliser le format suivant: YYYY-MM-JJ HH-MM"
      print "> "
      start_date = gets.chomp
    end
    puts " "
    return start_date
  end

  def get_duration
    puts "Au top. Combien de temps va-t-il durer (en minutes) ?"
    print "> "
    duration = gets.chomp.to_i
    puts ""
    return duration
  end

  def get_attendees
    puts "Génial. Qui va participer ? (Balance leurs e-mails dans un tableau [] !)"
    print "> "
    attendees = gets.chomp
    puts ""
    return attendees
  end

  def initialize
    title = get_title
    start_date = get_start_date
    duration = get_duration
    attendees = get_attendees
    my_event = Event.new(start_date, duration, title, attendees)
    puts "Super, c'est noté, ton évènement a été créé !"
    puts my_event.to_s
  end 

end