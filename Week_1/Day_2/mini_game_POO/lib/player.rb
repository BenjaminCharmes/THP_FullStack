class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "Le joueur #{@name} a #{@life_points} point(s) de vie."
  end

  def gets_damage(damage)
    @life_points -= damage
    if @life_points <= 0
      @life_points = 0
      puts "Le joueur #{@name} a été tué ! 💀"
    end
  end

  def attacks(player)
    puts "Le joueur #{@name} attaque le joueur #{player.name}."
    damage = compute_damage
    puts "Il lui inflige #{damage} points de dommages."
    player.gets_damage(damage)
  end

  def compute_damage
    return rand(1..6)
  end
  
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    super(name)
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "Le joueur #{@name} a #{@life_points} point(s) de vie et une arme de niveau #{@weapon_level}."
  end 

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon_found = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_found}."
    if new_weapon_found > @weapon_level
      @weapon_level = new_weapon_found
      puts "Youhou ! Elle est meilleure que ton arme actuelle: Tu la prends avec toi !"
    elsif new_weapon_found <= @weapon_level
      puts "M@*#$ ... Elle n'est pas mieux que ton arme actuelle ... Quel temps perdu !"
    end
  end

  def search_health_pack
    health_pack_found = rand(1..6)
    if health_pack_found == 1
      puts "Tu n'as rien trouvé ..."
    elsif health_pack_found >= 2 || health_pack_found <= 5
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      if @life_points > 50
        @life_points = 100
      elsif @life <= 50
        @life_points += 50
      end
      puts "Tu as maintenant #{life_points} points de vie."
    elsif health_pack_found == 6
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      if @life_points > 20
        @life_points = 100
      elsif @life <= 20
        @life_points += 80
      end
      puts "Tu as maintenant #{life_points} points de vie."
    end
  end

end