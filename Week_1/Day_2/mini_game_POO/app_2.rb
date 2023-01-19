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
sleep (1)
puts "Bonjour jeune aventurier ! Quel est ton prénom ?"
print "> "
humanplayer_name = gets.chomp
user = HumanPlayer.new(humanplayer_name)
sleep(1)
puts
puts "#{user.name} ?! Mais on se connaît déjà, non ?"
puts
sleep(1.5)
puts "Tu n'as pas l'air très vigoureux aujourd'hui ! Enfin bon, j'ai quand même confiance en toi."
puts
sleep(1.5)
puts "*Je ne parierais pas sur lui dans l'arène ...*"
puts
sleep(1.5)

enemies = Array.new
enemies << player1 = Player.new("Josiane")
enemies << player2 = Player.new("José")

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  user.show_state
  sleep(1)
  puts
  puts "Quelle action veux-tu effectuer ?"
  puts
  puts "a - Chercher une meilleure arme."
  puts "s - Chercher à se soigner."
  puts
  puts "Attaquer un joueur en vue:"
  puts "0 - Josiane a #{player1.life_points} points de vie."
  puts "1 - José a #{player2.life_points} points de vie."
  puts
  sleep(1)
  puts "Que souhaites-tu faire ?"
  print "> "
  choice = gets.chomp
  puts
  if choice == "a"
    user.search_weapon
    sleep(1)
  elsif choice == "s"
    user.search_health_pack
    sleep(1)
  elsif choice == "0"
    user.attacks(player1)
    sleep(1)
  elsif choice == "1"
    user.attacks(player2)
    sleep(1)
  end
  puts
  if user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
    puts "Les autres joueurs t'attaquent !"
    sleep(1)
    enemies.each do |player|
      if player.life_points > 0
        player.attacks(user)
        sleep(1)
        puts
      end
    end
  end
end

puts "La partie est finie."
puts
if player1.life_points <= 0 && player2.life_points <= 0
  puts "BRAVO ! TU AS GAGNÉ ! 👏"
elsif user.life_points == 0
  puts "Loser ! Tu as perdu ! 😒"
end
puts