class Game
  attr_accessor :human_player, :enemies

  def initialize(humanplayer_name)
    @human_player = HumanPlayer.new(humanplayer_name)
    @enemies = Array.new
    (1..4).each do |i|
      @enemies << Player.new("Ennemi_#{[i]}")
    end
  end

  def kill_player(player)
    @enemies.delete(player)
  end

  def is_still_ongoing?
    if user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
      return True
    else
      return False
    end
  end

  def show_players
    user.show_state
    puts "Il reste #{enemies.length} ennemies à vaincre."
  end

  def menu
    puts
    puts "Quelle action veux-tu effectuer ?"
    puts
    puts "a - Chercher une meilleure arme."
    puts "s - Chercher à se soigner."
    puts
    puts "Attaquer un joueur en vue:"
    puts
    @enemies.each do |player|
    puts "#{player.name.gsub("Ennemi_[", "").gsub("]", "")} - #{player.name} a #{player.life_points} points de vie."
    end
    puts
  end

  def menu_choice
    puts "Que souhaites-tu faire ?"
    print "> "
    choice = gets.chomp
    puts
    if choice == "a"
      human_player.search_weapon
    elsif choice == "s"
      human_player.search_health_pack
    elsif choice == "1"
      human_player.attacks(@enemies[0])
    elsif choice == "2"
      human_player.attacks(@enemies[1])
    elsif choice == "3"
      human_player.attacks(@enemies[2])
    elsif choice == "4"
      human_player.attacks(@enemies[3])
    end
    (0..@enemies.length-1).each do |i|
      if @enemies[i].life_points <= 0
        kill_player(@enemies[i])
      end
      break if i == (@enemies.length-1)
    end 
  end

  def enemies_attack
    if human_player.life_points > 0 && (enemies.length > 1)
      puts "Les autres joueurs t'attaquent !"
      enemies.each do |player|
          player.attacks(human_player)
      end
    end
  end

  def end
    puts "La partie est finie."
    puts
    if @enemies.length < 1
      puts "BRAVO ! TU AS GAGNÉ ! 👏"
    elsif human_player.life_points <= 0
      puts "Loser ! Tu as perdu ! 😒"
    end
    puts
  end

end