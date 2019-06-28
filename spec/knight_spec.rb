#spec/knight_spec.rb
require './lib/Knight.rb'

RSpec.describe Knight do
  subject(:knight) { Knight.new([0,0], 'black', 1) }

  describe "#initialize" do
    context "when game is started" do
      it "returns the position [0, 0]" do 
        expect(knight.position).to eql([0, 0])
      end

      xit "returns the utf code for white" do 
        expect(knight.figure).to eql("\u2658".force_encoding('utf-8'))
      end

      it "returns the utf code for black" do 
        expect(knight.figure).to eql("\u265E".force_encoding('utf-8'))
      end
    end
  end

      
  describe "#moves" do
    context "when in a position" do
      it "returns all legal moves" do
        knight.position = [3, 3]
        expect(knight.moves).to include([5, 4])
      end
    end

    context "when in the [0, 0] corner" do
      it "returns all legal moves" do
        expect(knight.moves[0]).to eql([2, 1])
        expect(knight.moves[1]).to eql([1, 2])
        expect(knight.moves[2]).to eql(nil)
        expect(knight.moves[3]).to eql(nil)
        expect(knight.moves[4]).to eql(nil)
      end
    end

    
  end

end