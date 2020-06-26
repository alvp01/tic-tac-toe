require_relative '../lib/board.rb'

describe Board do
  let(:game_board) { Board.new }

  describe '#move_made?' do
    context 'returns true if the input for the space is already ocupied, otherwise false' do
      it 'test if position is not yet ocupied' do
        expect(game_board.move_made?(1)).to eql(false)
      end

      it 'test if position is already ocupied' do
        game_board.board[1] = 'X'
        expect(game_board.move_made?(1)).to eql(true)
      end
    end
  end

  describe '#input_valid?' do
    context 'checks if the move the player entered is inside the board parameters' do
      it 'returns true if the move is inside the parameters' do
        expect(game_board.input_valid?(1)).to eql(true)
      end
      it 'returns false if the move is outside the parameters' do
        expect(game_board.input_valid?(10)).to eql(false)
      end
    end
  end

  describe '#win_cond_row?' do
    it 'returns false when there is no winning row' do
      expect(game_board.win_cond_row?).to eql(false)
    end

    it 'returns true if there is a winning row' do
      game_board.board[0] = 'X'
      game_board.board[1] = 'X'
      game_board.board[2] = 'X'
      expect(game_board.win_cond_row?).to eql(true)
    end
  end

  describe '#win_cond_col?' do
    it 'returns false when there is no winning column' do
      expect(game_board.win_cond_col?).to eql(false)
    end

    it 'returns true if there is a winning column' do
      game_board.board[0] = 'X'
      game_board.board[3] = 'X'
      game_board.board[6] = 'X'
      expect(game_board.win_cond_col?).to eql(true)
    end
  end

  describe '#win_cond_diag?' do
    it 'returns false when there is no winning diagonal' do
      expect(game_board.win_cond_diag?).to eql(false)
    end

    it 'returns true if there is a winning diagonal' do
      game_board.board[0] = 'X'
      game_board.board[4] = 'X'
      game_board.board[8] = 'X'
      expect(game_board.win_cond_diag?).to eql(true)
    end
  end
end
