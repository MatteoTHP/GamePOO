require 'pry'

class Game

  attr_accessor :human_player, :enemies
  @@enemies = []
  def initialize(input)
    @@enemies << player1 =Player.new("Josiane")
    @@enemies << player2 =Player.new("José")
    @@enemies << player3 =Player.new("Hugette")
    @@enemies << player4 =Player.new("Germaine")
    user = HumanPlayer.new(input)
        
   p @@enemies
   p user
   @@enemies.each do |x| # pour chaque npc de l'array

    puts "un(e) #{x.name} sauvage apparait !" # Pokemon style
  end
  end
 
 

 
  def kill_player 
      @@enemies.delete_if {|x| x.life_points <= 0}
  end

  def is_still_ongoing?
    if user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0 || player3.life_points > 0 || player4.life_points > 0)
      return true
    else
      return false
    end
  end

  def show_players
    puts "Voici ton état :"
    print user.show_state
    puts ""
    puts " Il reste #{enemies.count} ennemis !"
    puts " ----Appuyez sur une touche pour continuer----"
    gets.chomp
  end

  def menu
    while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0 || player3.life_points > 0 || player4.life_points > 0) # boucle qui s'arrete a la mort du joueur ou d'un des persos
      
      
      
      
      puts ""
      puts "Quelle action veux tu effectuer ?" # menu
      puts ""
      puts "a - chercher une meilleure arme"
      puts "s - chercher un health pack"
      puts ""
      puts "Attaquer un joueur en vue :"
      puts ""
        if  player1.life_points > 0 # n'affiche que si vivant
        print "0 -"
        puts "#{player1.show_state}"
        end
        if  player2.life_points > 0
        print "1 -"
        puts "#{player2.show_state}"
        end
        if  player3.life_points > 0 # n'affiche que si vivant
          print "2 -"
          puts "#{player3.show_state}"
          end
        if  player4.life_points > 0
          print "3 -"
          puts "#{player4.show_state}"
        end
      puts ""
  end

  def menu_choice
    puts ""
    
    
      choice = gets.chomp # chercher une arme
        if choice == "a"
          user.search_weapon
        end
      
        if choice == "s" # chercher un pack de vie
          user.search_health_pack
        end
    
        if choice == "0" # attaquer player1
          if player1.life_points > 0
            puts""
          puts user.attacks(enemies[choice.to_i])
          else
            puts "Vous attaquez le cadavre de #{player1.name} ! Erk ! "
          end
        end
    
        if choice == "1" # attaquer player2
          if player2.life_points > 0
            puts ""
            puts user.attacks(enemies[choice.to_i])
          else
            puts "Vous attaquez le cadavre de #{player2.name} ! Erk ! "
            
          end
        end


        if choice == "2" # attaquer player1
          if player3.life_points > 0
            puts""
          puts user.attacks(enemies[choice.to_i])
          else
            puts "Vous attaquez le cadavre de #{player4.name} ! Erk ! "
          end
        end
        
        
        if choice == "3" # attaquer player1
        if player4.life_points > 0
          puts""
        puts user.attacks(enemies[choice.to_i])
        else
          puts "Vous attaquez le cadavre de #{player4.name} ! Erk ! "
        end
      end

      self.killer_player
    
      puts ""  # pour le style
      puts " ----Appuyez sur une touche pour continuer----"
      gets.chomp 

  end


  def enemies_attack

      puts ""
      if user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0 || player3.life_points > 0 || player4.life_points > 0) 
      end
    puts ""
    if player1.life_points > 0  # npc n'attaquent que si ils sont vivants
      puts player1.attacks(user)
    end
    if player2.life_points > 0
      puts player2.attacks(user)
    end

    if player3.life_points > 0  # npc n'attaquent que si ils sont vivants
      puts player3.attacks(user)
    end
    if player4.life_points > 0
      puts player4.attacks(user)
    end

  end

  def end

    puts "###--- La partie est finie. ---###"
    puts""
      if user.life_points <= 0  # si on a gagné ou perdu
        puts "####-- Looser ! Tu as perdu ! --####"
      else
        puts "---- Bravo ! Tu as gagné ! ---- "
      end

  end

end
end

=begin
    puts "------------------------------------------------"
    puts "|   Bienvenue sur 'ILS VEULENT TOUS MA POO' !   |"
    puts "|Le but du jeu est d'être le dernier survivant !|"
    puts "-------------------------------------------------"
    puts 
    puts " quel est votre nom ?"
    input = gets.chomp
    puts "Vous ètes le Heros #{input}  !"
    user = HumanPlayer.new("#{input}") # crée le joueur puis 2 npc
    player1 =Player.new("Josiane")
    player2 =Player.new("José")
    enemies = []
    enemies << player1    # met les npc dans un array
    enemies << player2
    enemies.each do |x| # pour chaque npc de l'array
    
      puts "un(e) #{x.name} sauvage apparait !" # Pokemon style
    end
    
  
      
      
      
    
      puts ""
      puts " ----Appuyez sur une touche pour continuer----"
      gets.chomp 
    
      
    
    end  # sortie de boucle, fin du jeu

    
=end  

