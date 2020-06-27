class Player
  attr_reader :player_name, :player_symbol
  def initialize(player_name, player_symbol)
    @player_name = player_name
    @player_symbol = player_symbol
  end
end
