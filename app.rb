# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
Bundler.require

# lignes qui appellent les fichiers lib/game.rb et lib/player.rb

require_relative 'lib/game'
require_relative 'lib/player'

    player1 =Player.new("Josiane") # crée 2 npc
    player2 =Player.new("José")
    puts "à ma droite #{player1.name}"
    puts "à ma gauche #{player2.name}"
    puts 
    while player1.life_points > 0 && player2.life_points > 0 # boucle qui s'arrete a la mort d'un des persos
      puts "Voici l'état des joueurs :"
      print player1.show_state  
      print player2.show_state
      puts ""
      
      puts "Passons a la phase d'attaque :"
      puts player1.attacks(player2)
      
      if player2.life_points <= 0
        break
      end
      puts player2.attacks(player1)
      
      puts ""
    end



