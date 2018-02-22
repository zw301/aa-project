require 'rspec'
require 'tower_of_hanoi'


RSpec.describe "#Tower_of_hanoi" do
  subject(:game) { Game.new}
  describe "#initilize" do
    it "keep three array" do
      expect(game.piles.length).to eq(3)
    end

    it "one pile has three discs and others are empty" do
      expect(game.piles[1]).to be_empty
      expect(game.piles[2]).to be_empty
    end
  end

  describe "#move" do
    context "when the user type invalid move" do
      before do
        game.piles = [[], [1, 2], [3]]
      end
      it "raise error if invalid move" do
        expect { game.move(0, 2) }.to raise_error("This is an invalid move")
      end
      it "the disc can not put to the pile where the last disc is smaller than it" do
        expect { game.move(2, 1)}.to raise_error("This is an invalid move")
      end
    end
    context "when valid move" do
      before do
        game.piles = [[1], [2], [3]]
      end
      it "move ond disc to another pile" do
        game.move(0, 1)
        expect(game.piles).to eq([[], [2, 1], [3]])
      end
    end
  end

  describe "#won?" do
    it "return true if all discs removed from pile 1" do
      game.piles = [[], [1, 2, 3], []]
      expect(game.won?).to be(true)
    end

    it "return false if no pile's length is 3" do
      game.piles = [[], [1, 2], [3]]
      expect(game.won?).to be(false)
    end
  end

end
