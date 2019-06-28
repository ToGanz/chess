#spec/chess.rb
require './lib/board'

RSpec.describe Board do
  subject(:board) { Board.new }

  describe "#initialize" do
    context "when game is started" do
      xit { expect(board.grid).to eql(Array.new(8) { Array.new(8) { ' ' } }) } 
    end
  end

  # describe "#setup_board" do
  #   context "when game is started" do
  #     it { expect(board.setup_board).to eql(Array.new(8) { Array.new(8) { ' ' } }) } 
  #   end
  # end#

  describe "#display" do
    context "when board is displayed" do
      
      xit { 

        #type.force_encoding('utf-8')
        #board.grid[0][0] = Tower.new([0,0], 'white', 1)
        board.display
        expect(board.display).to eql(Array.new(8) { Array.new(8) { ' ' } }) } 
    end
  end

  describe "#possible_move?" do
    context "when a valid move is called" do
      it "returns true" do
        expect(board.possible_move?([1, 1], [2, 1])).to eql(true) 
      end
    end

    context "when a valid move is called" do
      it "returns true" do
        expect(board.possible_move?([1, 1], [3, 1])).to eql(true) 
      end
    end

    context "when an invalid move is called" do
      it "returns false" do
        expect(board.possible_move?([1, 1], [4, 2])).to eql(false) 
      end
    end

    context "when a move is blocked by same color" do
      it "returns false" do
        board.grid[2][1] = Pawn.new([2, 1], 'black', 1)
        expect(board.possible_move?([1, 1], [3, 1])).to eql(false) 
      end
    end

    context "when a move is blocked by opponent color" do
      it "returns true" do
        board.grid[2][1] = Pawn.new([2, 1], 'white', 1)
        expect(board.possible_move?([1, 1], [2, 1])).to eql(true) 
      end
    end

    context "when a valid move is called with a horse" do
      it "returns true" do
        expect(board.possible_move?([0, 1], [2, 2])).to eql(true) 
      end
    end

    context "when a horse is blocked by same color" do
      it "returns true" do
        board.grid[2][2] = Pawn.new([2, 2], 'black', 1)
        expect(board.possible_move?([0, 1], [2, 2])).to eql(false) 
      end
    end

  end

  describe "#move" do
    context "when a move is made" do
      it "positions are changed" do
        # puts '---'
        # puts board.grid[1][1].figure
        # puts board.grid[2][1].figure
        # board.move([1, 1], [2, 1])
        # puts '---'
        # puts board.grid[1][1].figure
        # puts board.grid[2][1].figure
        p = board.grid[1][1]
        expect(board.move([1, 1], [2, 1])).to eql(p) 
        # puts '---'
        # puts board.grid[1][1].figure
        # puts board.grid[2][1].figure
      end
    end
  end

  # describe "#move" do
  #   context "when player chooses a move" do
  #     it "move from 0,0 to 5,5" do
  #       board.move(0, 'X')
  #       expect(board.grid[5][0]).to eql('X')
  #     end
  #   end
  # end
end