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
    puts "Vous ètes le Heros #{input} !"


my_game = Game.new("#{input}")

my_game.kill_player
my_game.is_still_ongoing?
my_game.show_players
my_game.menu
my_game.menu_choice
my_game.enemies_attack
my_game.end




binding.pry

