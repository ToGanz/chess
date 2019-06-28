#spec/bishop_spec.rb
require './lib/bishop.rb'

RSpec.describe Bishop do
  subject(:bishop) { Bishop.new([0,0], 'black', 1) }

  describe "#initialize" do
    context "when game is started" do
      it "returns the position [0, 0]" do 
        expect(bishop.position).to eql([0, 0])
      end

      xit "returns the utf code for white" do 
        expect(bishop.figure).to eql("\u2657".force_encoding('utf-8'))
      end

      it "returns the utf code for black" do 
        expect(bishop.figure).to eql("\u265D".force_encoding('utf-8'))
      end
    end
  end

  describe "#move_diagonal_up_left" do
    context "when bishop is at [0, 0]" do
      it { expect(bishop.move_diagonal_up_left).to eql([]) } 
    end

    context "when bishop is at [1, 1]" do
      it "returns [0, 0]" do
        bishop.position = [1, 1]
        expect(bishop.move_diagonal_up_left).to eql([[0, 0]]) 
      end
    end

    context "when bishop is at [2, 2]" do
      it "returns [[1, 1], [0, 0]]" do
        bishop.position = [2, 2]
        expect(bishop.move_diagonal_up_left).to eql([[1, 1], [0, 0]]) 
      end
    end

  end

  describe "#move_diagonal_down_right" do
    context "when bishop is at [6, 6]" do
      it "returns [7, 7]" do
        bishop.position = [6, 6]
        expect(bishop.move_diagonal_down_right).to eql([[7, 7]]) 
      end
    end
  end
      
  describe "#moves" do
    context "when in a position" do
      it "returns all legal moves" do
        bishop.position = [3, 3]
        expect(bishop.moves[0]).to include([2, 4], [1, 5], [0, 6])
        expect(bishop.moves[1]).to include([4, 4], [5, 5], [6, 6], [7, 7])
        expect(bishop.moves[2]).to include([2, 2], [1, 1], [0, 0])
        expect(bishop.moves[3]).to include([4, 2], [5, 1], [6, 0])
      end
    end

      context "when in the 7, 7 corner" do
        it "returns all legal moves" do
          bishop.position = [7, 7]
          expect(bishop.moves[0]).to eql([])
          expect(bishop.moves[1]).to eql([])
          expect(bishop.moves[2]).to eql([[6, 6], [5, 5], [4, 4], [3, 3], [2, 2], [1, 1], [0, 0]])
          expect(bishop.moves[3]).to eql([])
        end
      end

      context "when in the 7, 0 corner" do
        it "returns all legal moves" do
          bishop.position = [7, 0]
          expect(bishop.moves[0]).to eql([[6, 1], [5, 2], [4, 3], [3, 4], [2, 5], [1, 6], [0, 7]])
          expect(bishop.moves[1]).to eql([])
          expect(bishop.moves[2]).to eql([])
          expect(bishop.moves[3]).to eql([])
        end
      end

      context "when in the 0, 7 corner" do
        it "returns all legal moves" do
          bishop.position = [0, 7]
          expect(bishop.moves[0]).to eql([])
          expect(bishop.moves[1]).to eql([])
          expect(bishop.moves[2]).to eql([])
          expect(bishop.moves[3]).to eql([[1, 6], [2, 5], [3, 4], [4, 3], [5, 2], [6, 1], [7, 0]])
        end
      end

      context "when in the 0, 0 corner" do
        it "returns all legal moves" do
          bishop.position = [0, 0]
          expect(bishop.moves[0]).to eql([])
          expect(bishop.moves[1]).to eql([[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7]])
          expect(bishop.moves[2]).to eql([])
          expect(bishop.moves[3]).to eql([])
        end
      end

  end

end