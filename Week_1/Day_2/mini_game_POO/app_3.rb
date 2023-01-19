require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts
puts "----------------------------------------------------"
puts "|                                                  |"
puts "|     Bienvenue sur: ILS VEULENT TOUS MA POO !     |"
puts "|  Le but du jeu est d'être le dernier survivant.  |"
puts "|                                                  |"
puts "----------------------------------------------------"
puts
puts "Bonjour jeune aventurier ! Quel est ton prénom ?"
print "> "
humanplayer_name = gets.chomp
puts

my_game = Game.new(humanplayer_name)

# binding.pry

while my_game.human_player.life_points > 0 && (my_game.enemies.length > 0)
  my_game.human_player.show_state
  my_game.menu
  my_game.menu_choice
  my_game.enemies_attack
end

my_game.end

# binding.pry