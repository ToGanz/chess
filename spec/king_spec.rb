#spec/king_spec.rb
require './lib/king.rb'

RSpec.describe King do
  subject(:king) { King.new([0,0], 'black', 1) }

  describe "#initialize" do
    context "when game is started" do
      it "returns the position [0, 0]" do 
        expect(king.position).to eql([0, 0])
      end

      xit "returns the utf code for white" do 
        expect(king.figure).to eql("\u2654".force_encoding('utf-8'))
      end

      it "returns the utf code for black" do 
        expect(king.figure).to eql("\u265A".force_encoding('utf-8'))
      end
    end
  end

      
  describe "#moves" do
    context "when in a position" do
      it "returns all legal moves" do
        king.position = [3, 3]
        expect(king.moves[0]).to eql([2, 3])
        expect(king.moves[1]).to eql([4, 3])
        expect(king.moves[2]).to eql([3, 4])
        expect(king.moves[3]).to eql([3, 2])
        expect(king.moves[4]).to eql([2, 4])
        expect(king.moves[5]).to eql([4, 4])
        expect(king.moves[6]).to eql([2, 2])
        expect(king.moves[7]).to eql([4, 2])
      end
    end

    context "when in the [0, 0] corner" do
      it "returns all legal moves" do
        expect(king.moves[0]).to eql(nil)
        expect(king.moves[1]).to eql([1, 0])
        expect(king.moves[2]).to eql([0, 1])
        expect(king.moves[3]).to eql(nil)
        expect(king.moves[4]).to eql(nil)
        expect(king.moves[5]).to eql([1, 1])
        expect(king.moves[6]).to eql(nil)
        expect(king.moves[7]).to eql(nil)
      end
    end

    
  end

end