#spec/rook_spec.rb
require './lib/rook'

RSpec.describe Rook do
  subject(:tower) { Rook.new([0,0], 'black', 1) }

  describe "#initialize" do
    context "when game is started" do
      it "returns the position [0, 0]" do 
        expect(tower.position).to eql([0, 0])
      end

      xit "returns the utf code for white" do 
        expect(tower.figure).to eql("\u2656".force_encoding('utf-8'))
      end

      it "returns the utf code for black" do 
        expect(tower.figure).to eql("\u265C".force_encoding('utf-8'))
      end
    end
  end

  describe "#move_up" do
    context "when tower is at [0, 0]" do
      it { expect(tower.move_up).to eql([]) } 
    end

    context "when tower is at [1, 0]" do
      it "returns [0, 0]" do
        tower.position = [1, 0]
        expect(tower.move_up).to eql([[0, 0]]) 
      end
    end

    context "when tower is at [2, 0]" do
      it "returns [[1, 0], [0, 0]]" do
        tower.position = [2, 0]
        expect(tower.move_up).to eql([[1, 0], [0, 0]]) 
      end
    end

  end

  describe "#move_right" do
    context "when tower is at [6, 6]" do
      it "returns [6, 7]" do
        tower.position = [6, 6]
        expect(tower.move_right).to eql([[6, 7]]) 
      end
    end
  end
      
  describe "#moves" do
    context "when in a position" do
      it "returns all legal moves" do
        tower.position = [3, 3]
        expect(tower.moves[0]).to include([2, 3], [1, 3], [0, 3])
        expect(tower.moves[1]).to include([4, 3], [5, 3], [6, 3], [7, 3])
        expect(tower.moves[2]).to include([3, 4], [3, 5], [3, 6], [3, 7])
        expect(tower.moves[3]).to include([3, 2], [3, 1], [3, 0])
      end
    end

    context "when in a corner" do
      it "returns all legal moves" do
        tower.position = [0, 0]
        expect(tower.moves[0]).to eql([])
        expect(tower.moves[1]).to include([1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0])
        expect(tower.moves[2]).to include([0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7])
        expect(tower.moves[3]).to eql([])
      end
    end
  end

end