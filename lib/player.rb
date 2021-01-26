require 'pry'
require 'time'

class Player  # classe pour les NPC 
  attr_accessor :name, :life_points


  def initialize(name)
  @life_points  = 10 
  @name = name
  end

  def show_state  # méthode pour voir les stats 
    puts "#{self.name} a #{self.life_points} points de vie"
  end
  def gets_damage(damage) # méthode pour calculer les degats 
    self.life_points = self.life_points - damage
    
    
  end

  def attacks(attacked_player) # méthode pour attaquer quelqu'un 
    damage = compute_damage
    attacked_player.gets_damage(damage)
    puts " #{self.name} attaque #{attacked_player.name} !"
    puts""
    puts "Il lui inflige #{damage} points de dommages !"
    if attacked_player.life_points <= 0
      puts "Le joueur #{attacked_player.name} a été tué !"
    end
  end


  def compute_damage  # méthode qui randomise les degats 
    return rand(1..6)
  end

  
end


class HumanPlayer < Player  # classe pour le joueur qui herite de la classe Player(npc)

  attr_accessor :weapon_level, :life_points

  def initialize(name) # changement pour le joueur
    @life_points  = 100
    @name = name
    @weapon_level = 1

  end

  def show_state # ajout de l'arme 
    puts "#{self.name} a #{self.life_points} points de vie et une arme de niveau #{self.weapon_level} !"
  end

  def compute_damage # ajout de l'arme 
    return rand(1..6) * @weapon_level
  end

  def search_weapon # methode pour chercher une autre arme
    new_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon}"

      if new_weapon > weapon_level
        self.weapon_level = new_weapon
        puts self.weapon_level
        puts"Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
      else
        puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
      end
    
  end

  def search_health_pack # methode pour chercher unpack de soin
    dice =  rand(1..6)
    puts dice
      if dice == 1
        puts "Tu n'as rien trouvé... "
      elsif dice > 1 && dice < 6 
        puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        if self.life_points > 50
          self.life_points = 100
        else
          self.life_points = self.life_points + 50
        end
      elsif dice == 6
        puts "Waouw, tu as trouvé un pack de +80 points de vie !"
        if self.life_points > 20
          self.life_points = 100
        else
          self.life_points = self.life_points + 80
        end
      end
      
  end

end

