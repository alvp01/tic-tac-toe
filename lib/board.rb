class Board
  attr_accessor :board

  def initialize
    @board = Array(1..9)
  end

  def display_board
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts '----------'
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts '----------'
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  def update_board(ind, symb)
    @board[ind] = symb
  end

  def input_valid?(user_input)
    return true if @board.include?(user_input)

    false
  end

  def win_cond?
    return true if @board[0] == @board[1] and @board[1] == @board[2] 
    return true if @board[3] == @board[4] and @board[4] == @board[5]
    return true if @board[6] == @board[7] and @board[7] == @board[8]
    return true if @board[0] == @board[3] and @board[3] == @board[6]
    return true if @board[1] == @board[4] and @board[4] == @board[7]
    return true if @board[2] == @board[5] and @board[8] == @board[5]
    return true if @board[0] == @board[4] and @board[4] == @board[8]
    return true if @board[2] == @board[4] and @board[4] == @board[6]
    false
  end
end
