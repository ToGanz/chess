require './lib/chess_piece.rb'

class Queen < ChessPiece
  attr_accessor :number

  def initialize(position, color, number)
    super(position, color)
    @figure = figure_color
    @number = number
  end

  def figure_color
    if @color == 'white'
      "\u2655".force_encoding('utf-8')
    else 
      "\u265B".force_encoding('utf-8')
    end
  end

  def moves
    legal_moves = []
    legal_moves << move_up
    legal_moves << move_down
    legal_moves << move_right
    legal_moves << move_left
    legal_moves << move_diagonal_up_right
    legal_moves << move_diagonal_down_right
    legal_moves << move_diagonal_up_left
    legal_moves << move_diagonal_down_left
  end

end