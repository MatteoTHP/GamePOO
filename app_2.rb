# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
Bundler.require

# lignes qui appellent les fichiers lib/game.rb et lib/player.rb

require_relative 'lib/game'
require_relative 'lib/player'


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
while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0) # boucle qui s'arrete a la mort du joueur ou d'un des persos
  puts "Voici ton état :"
  print user.show_state
  puts ""
  puts " ----Appuyez sur une touche pour continuer----"
  gets.chomp
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

  puts ""  # pour le style
  puts " ----Appuyez sur une touche pour continuer----"
  gets.chomp 
  
   
  puts ""
    if user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
      puts "Les autres joueurs t'attaquent !"
    end
  puts ""
  if player1.life_points > 0  # npc n'attaquent que si ils sont vivants
    puts player1.attacks(user)
  end
  if player2.life_points > 0
    puts player2.attacks(user)
  end

  puts ""
  puts " ----Appuyez sur une touche pour continuer----"
  gets.chomp 

  

end  # sortie de boucle, fin du jeu
puts "###--- La partie est finie. ---###"
puts""
  if user.life_points <= 0  # si on a gagné ou perdu
    puts "####-- Looser ! Tu as perdu ! --####"
  else
    puts "---- Bravo ! Tu as gagné ! ---- "
  end



binding.pry

