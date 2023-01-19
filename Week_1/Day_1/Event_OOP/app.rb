# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
Bundler.require

# lignes qui appellent les fichiers lib/user.rb et lib/event.rb
# comme ça, tu peux faire User.new dans ce fichier d'application. Top.
require_relative 'lib/user'
require_relative 'lib/event'
require_relative 'lib/event_creator'


# Maintenant c'est open bar pour tester ton application. Tous les fichiers importants sont chargés
# Tu peux faire User.new, Event.new, binding.pry, User.all, etc.

# Tous les tests:

# User.new("julie@julie.com", 35)
# User.new("jean@jean.com", 23)
# User.new("claude@claude.com", 75)

# user_1 = User.find_by_email("claude@claude.com")

# puts "Voici l'age du User trouvé : #{user_1.age}"

# my_event = Event.new("2019-01-13 09:00", 10, "standup quotidien", ["truc@machin.com", "bidule@chose.fr"])

# puts my_event.start_date

# my_event.postpone_24h

# puts my_event.start_date

# puts my_event.end_date 

# my_event.is_past?
# my_event.is_future?
# my_event.is_soon?

# my_event.to_s

EventCreator.new