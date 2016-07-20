require 'game'

describe Game do
  subject(:game) { described_class.new(player_1, player_2) }
  let(:player_1) { double :player }
  let(:player_2) { double :player }

  describe '#attack' do
    it 'damages player' do
      expect(player_2).to receive(:deduct_hp)
      game.attack(player_2)
    end
  end
end
