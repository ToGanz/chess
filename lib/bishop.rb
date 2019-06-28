require './lib/chess_piece.rb'

class Bishop < ChessPiece
  attr_accessor :number

  def initialize(position, color, number)
    super(position, color)
    @figure = figure_color
    @number = number
  end

  def figure_color
    if @color == 'white'
      "\u2657".force_encoding('utf-8')
    else 
      "\u265D".force_encoding('utf-8')
    end
  end

  def moves
    legal_moves = []
    legal_moves << move_diagonal_up_right
    legal_moves << move_diagonal_down_right
    legal_moves << move_diagonal_up_left
    legal_moves << move_diagonal_down_left
  end

end