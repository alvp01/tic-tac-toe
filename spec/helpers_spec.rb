require_relative '../lib/helpers.rb'

describe Helpers do
  let(:help) { Helpers.new }
  describe '#valid_symbol?' do
    context "checks if the symbol the player chooses is 'X' or 'O'" do
      it "returns true if symbol is 'X' or 'O'" do
        expect(help.valid_symbol?('X')).to eql(true)
      end

      it "returns false if symbol is not 'X' or 'O'" do
        expect(help.valid_symbol?('Z')).to eql(false)
      end
    end
  end
end
