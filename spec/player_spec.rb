require_relative '../lib/player.rb'

describe Player do
  describe '#initialize' do
    let(:player_name) { 'abel' }
    let(:symbol) { 'X' }

    it 'test initialize method' do
      name = 'Abel'
      symbol = 'X'
      player = Player.new(name, symbol)
      expect(player.player_name).to eql('Abel')
      expect(player.player_symbol).to eql('X')
    end
  end
end
