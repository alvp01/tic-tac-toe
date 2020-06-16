#!/usr/bin/env ruby
require_relative '../lib/string.rb'
require_relative '../lib/helpers.rb'
require_relative '../lib/board.rb'

helpers = Helpers.new

puts 'Welcome to Tic Tac Toe !'
puts 'Player 1, what do you want to use X or O?'
player_1_sym = gets.strip.upcase
game_board = Board.new
loop do
  if helpers.valid_symbol?(player_1_sym)
    # User input validated. Player selected an X or an O
    puts 'Ready Player 1 !'
    player_2_sym = player_1_sym.eql? 'X' ? 'O' : 'X'
    p "Player 2 is now #{player_2_sym}"
    player_1 = Player.new(player_1_sym)
    player_2 = Player.new(player_2_sym)
    break
  else
    puts "Enter either an X or an O. Not #{player_1_sym}".red
    player_1_sym = gets.strip.upcase
  end
end

## Player selects a cell depending on who the player is, and redraw the board
puts 'Player 1, please select a cell. Between 1 and 9.'
game_board.display_board
game_board.update_board(3,'O')
game_board.display_board

#=>2  board[1]=X or O
#board.includes(input)
#validate (for gameboard) => invalid if user inputs a entries out of range (<1 or >9 or letters/symbols)