require_relative '../lib/board.rb'

describe Board do
  let(:game_board) { Board.new }

  describe '#move_made?' do
    it 'returns true if the input for the space is valid, otherwise false' do
      expect(p game_board.move_made?(1)).to eql(false)
    end
  end
end