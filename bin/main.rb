#!/usr/bin/env ruby
require_relative '../lib/string.rb'
require_relative '../lib/helpers.rb'

helpers = Helpers.new

puts 'Welcome to Tic Tac Toe !'
puts 'Player 1, what do you want to use X or O?'
player_1_sym = gets.strip.upcase

def display_board
  board = Array(1..9)
  puts "#{board[0]} | #{board[1]} | #{board[2]}"
  puts '---------'
  puts "#{board[3]} | #{board[4]} | #{board[5]}"
  puts '---------'
  puts "#{board[6]} | #{board[7]} | #{board[8]}"
end

loop do
  if helpers.valid_symbol?(player_1_sym)
    # User input validated. Player selected an X or an O
    puts 'Ready Player 1 !'
    player_2_sym = player_1_sym == 'X' ? 'O' : 'X'
    p "Player 2 is now #{player_2_sym}"
    break
  else
    puts "Enter either an X or an O. Not #{player_1_sym}".red
    player_1_sym = gets.strip.upcase
  end
end

## Player selects a cell depending on who the player is, and redraw the board
puts 'Select a cell. Between 1 and 9.'
display_board
