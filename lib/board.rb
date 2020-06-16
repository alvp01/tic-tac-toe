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

    def input_valid?(n)
        if (n.is_a? Integer)
            if @board.include?(n)
                true
            end  
        end
        false
    end
end
