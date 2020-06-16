#!/usr/bin/env ruby
require_relative '../lib/string.rb'
require_relative '../lib/helpers.rb'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'


helpers = Helpers.new

puts 'Welcome to Tic Tac Toe !'
puts 'Player 1, what do you want to use X or O?'
player_1_sym = gets.strip.upcase
player_2_sym = ''
game_board = Board.new
player_1 = nil
player_2 = nil

loop do
  if helpers.valid_symbol?(player_1_sym)
    # User input validated. Player selected an X or an O
    puts 'Ready Player 1 !'
    player_2_sym = player_1_sym == 'X' ? 'O' : 'X'
    p "Player 2 is now #{player_2_sym}"
    player_1 = Player.new("Player 1", player_1_sym)
    player_2 = Player.new("Player 2", player_2_sym)
    break
  else
    puts "Enter either an X or an O. Not #{player_1_sym}".red
    player_1_sym = gets.strip.upcase
  end
end

game_board.display_board

def play_game(game_board, player)
  puts "#{player.player_name}. Whats your move?".red
  p 'Enter a number between 1 and 9.'
  player_move = gets.strip
  until game_board.input_valid?(player_move.to_i)
    puts '#{player_name}. Whats your move?'.green
    puts 'Remember to enter a number between 1 and 9.'.red
    player_move = gets.strip
    p "#{player_move} move in the loop"
  end
  game_board.update_board(player_move.to_i - 1, player.player_symbol)
end


moves_counter = 0
while moves_counter < 9
  if moves_counter.even?
    play_game(game_board,player_1)
  else
    play_game(game_board,player_2)
  end
  p
  game_board.display_board
  moves_counter += 1
end
puts 'Well its a DRAW!'.red
# puts 'Player 1, please select a cell. Between 1 and 9.'
# game_board.display_board
# game_board.update_board(3,'O')
# game_board.display_board

#=>2  board[1]=X or O
# board.includes(input)
# validate (for gameboard) => invalid if user inputs a entries out of range (<1 or >9 or letters/symbols)
