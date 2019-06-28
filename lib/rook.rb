require './lib/chess_piece.rb'

class Rook < ChessPiece
  attr_accessor :number

  def initialize(position, color, number)
    super(position, color)
    @figure = figure_color
    @number = number
  end

  def figure_color
    if @color == 'white'
      "\u2656".force_encoding('utf-8')
    else 
      "\u265C".force_encoding('utf-8')
    end
  end

  def moves
    # legal_moves = [move_up, move_down, move_right, move_left]
    legal_moves = []
    legal_moves << move_up
    legal_moves << move_down
    legal_moves << move_right
    legal_moves << move_left
  end

end