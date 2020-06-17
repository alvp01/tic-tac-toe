class Player
  attr_reader :player_symbol, :player_name
  def initialize(player_name, player_symbol)
    @player_symbol = player_symbol
    @player_name = player_name
  end
end
