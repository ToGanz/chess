require './lib/chess_piece.rb'

class King < ChessPiece
  attr_accessor :number

  def initialize(position, color, number)
    super(position, color)
    @figure = figure_color
    @number = number
  end

  def figure_color
    if @color == 'white'
      "\u2654".force_encoding('utf-8')
    else 
      "\u265A".force_encoding('utf-8')
    end
  end

  def moves
    legal_moves = []
    legal_moves << move_up[0]
    legal_moves << move_down[0]
    legal_moves << move_right[0]
    legal_moves << move_left[0]
    legal_moves << move_diagonal_up_right[0]
    legal_moves << move_diagonal_down_right[0]
    legal_moves << move_diagonal_up_left[0]
    legal_moves << move_diagonal_down_left[0]
  end

end