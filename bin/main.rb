#!/usr/bin/env ruby
require_relative '../lib/string.rb'
require_relative '../lib/helpers.rb'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

def display_board(board)
  puts
  puts "#{board[0]} | #{board[1]} | #{board[2]}"
  puts '----------'
  puts "#{board[3]} | #{board[4]} | #{board[5]}"
  puts '----------'
  puts "#{board[6]} | #{board[7]} | #{board[8]}"
  puts
end

helpers = Helpers.new

puts 'Welcome to Tic Tac Toe !'.blue
puts 'Player 1, what do you want to use X or O?'.green
player_1_sym = gets.strip.upcase
player_2_sym = ''
game_board = Board.new
player1 = nil
player2 = nil

loop do
  if helpers.valid_symbol?(player_1_sym)
    puts 'Ready Player 1 !'.green
    player_2_sym = player_1_sym == 'X' ? 'O' : 'X'
    puts "Player 2 is now #{player_2_sym}".blue
    player1 = Player.new('Player 1', player_1_sym)
    player2 = Player.new('Player 2', player_2_sym)
    break
  else
    puts "Enter either an X or an O. Not #{player_1_sym}".red
    player_1_sym = gets.strip.upcase
  end
end

display_board(game_board.board)

def play_game(game_board, player)
  puts "#{player.player_name}. Whats your move?".red
  puts 'Enter a number between 1 and 9.'.brown
  player_move = gets.strip

  until game_board.input_valid?(player_move.to_i)
    if game_board.move_made?(player_move.to_i - 1)
      puts 'Move already made !'.red
    else
      puts 'Remember to enter a number between 1 and 9.'.red
    end
    puts "#{player.player_name}. Whats your move?".green
    player_move = gets.strip
  end
  game_board.update_board(player_move.to_i - 1, player.player_symbol)
  display_board(game_board.board)
end

moves_counter = 0
while moves_counter < 9
  if moves_counter.even?
    play_game(game_board, player1)
    if game_board.win_cond_row? or game_board.win_cond_col? or game_board.win_cond_diag?
      puts 'Player 1 won!'.blue
      break
    end
  else
    play_game(game_board, player2)
    if game_board.win_cond_row? or game_board.win_cond_col? or game_board.win_cond_diag?
      puts 'Player 2 won!'.magenta
      break
    end
  end
  moves_counter += 1
end
puts 'Well its a DRAW!'.cyan unless game_board.win_cond_row? or game_board.win_cond_col? or game_board.win_cond_diag?
