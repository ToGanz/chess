#spec/queen_spec.rb
require './lib/queen.rb'

RSpec.describe Queen do
  subject(:queen) { Queen.new([0,0], 'black', 1) }

  describe "#initialize" do
    context "when game is started" do
      it "returns the position [0, 0]" do 
        expect(queen.position).to eql([0, 0])
      end

      xit "returns the utf code for white" do 
        expect(queen.figure).to eql("\u2655".force_encoding('utf-8'))
      end

      it "returns the utf code for black" do 
        expect(queen.figure).to eql("\u265B".force_encoding('utf-8'))
      end
    end
  end

  describe "#move_diagonal_up_left" do
    context "when queen is at [0, 0]" do
      it { expect(queen.move_diagonal_up_left).to eql([]) } 
    end

    context "when queen is at [1, 1]" do
      it "returns [0, 0]" do
        queen.position = [1, 1]
        expect(queen.move_diagonal_up_left).to eql([[0, 0]]) 
      end
    end

    context "when queen is at [2, 2]" do
      it "returns [[1, 1], [0, 0]]" do
        queen.position = [2, 2]
        expect(queen.move_diagonal_up_left).to eql([[1, 1], [0, 0]]) 
      end
    end

  end

  describe "#move_diagonal_down_right" do
    context "when queen is at [6, 6]" do
      it "returns [7, 7]" do
        queen.position = [6, 6]
        expect(queen.move_diagonal_down_right).to eql([[7, 7]]) 
      end
    end
  end
      
  describe "#moves" do
    context "when in a position" do
      it "returns all legal moves" do
        queen.position = [3, 3]
        expect(queen.moves[0]).to include([2, 3], [1, 3], [0, 3])
        expect(queen.moves[1]).to include([4, 3], [5, 3], [6, 3], [7, 3])
        expect(queen.moves[2]).to include([3, 4], [3, 5], [3, 6], [3, 7])
        expect(queen.moves[3]).to include([3, 2], [3, 1], [3, 0])
        expect(queen.moves[4]).to include([2, 4], [1, 5], [0, 6])
        expect(queen.moves[5]).to include([4, 4], [5, 5], [6, 6], [7, 7])
        expect(queen.moves[6]).to include([2, 2], [1, 1], [0, 0])
        expect(queen.moves[7]).to include([4, 2], [5, 1], [6, 0])
      end
    end
  end

end