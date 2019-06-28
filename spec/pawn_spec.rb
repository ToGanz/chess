#spec/pawn_spec.rb
require './lib/pawn.rb'

RSpec.describe Pawn do
  subject(:pawn) { Pawn.new([0,0], 'white', 1) }

  describe "#initialize" do
    context "when game is started" do
      it "returns the position [0, 0]" do 
        expect(pawn.position).to eql([0, 0])
      end

      it "returns the utf code for white" do 
        expect(pawn.figure).to eql("\u2659".force_encoding('utf-8'))
      end

      xit "returns the utf code for black" do 
        expect(pawn.figure).to eql("\u265F".force_encoding('utf-8'))
      end
    end
  end

      
  describe "#moves" do
    context "when in a position" do
      it "returns all legal moves" do
        pawn.position = [6, 0]
        expect(pawn.moves[0]).to eql([[5, 0], [4, 0]])
        expect(pawn.moves[1]).to eql([5, 1])
        expect(pawn.moves[2]).to eql(nil)
      end
    end
  end

end