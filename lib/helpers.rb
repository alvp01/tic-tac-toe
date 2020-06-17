class Helpers
  attr_accessor :player_sym
  def initialize; end

  def valid_symbol?(player_sym)
    player_sym.eql? 'X' or player_sym.eql? 'O'
  end
end
