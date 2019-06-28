require './lib/chess_piece.rb'


class Pawn < ChessPiece
  attr_accessor :number

  def initialize(position, color, number)
    super(position, color)
    @figure = figure_color
    @number = number
  end

  def figure_color
    if @color == 'white'
      "\u2659".force_encoding('utf-8')
    else 
      'P'
      #"\u265F".force_encoding('utf-8')
    end
  end

  def moves
    # if @color == 'white'
    #   if @position[0] == 6
    #     up = move_up
    #     legal_moves = [[up[0], up[1]], move_diagonal_up_right[0], move_diagonal_up_left[0]]
    #   else
    #     legal_moves = [move_up[0], move_diagonal_up_right[0], move_diagonal_up_left[0]]
    #   end
    # elsif @color == 'black'
    #   if @position[0] == 1
    #     down = move_down
    #     legal_moves = [[down[0], down[1]], move_diagonal_down_right[0], move_diagonal_down_left[0]]
    #   else
    #     legal_moves = [move_down[0], move_diagonal_down_right[0], move_diagonal_down_left[0]]
    #   end
    
    # end
    legal_moves = []
    if @color == 'white'
      if @position[0] == 6 #starting position
        up = move_up
        legal_moves << [up[0], up[1]]
      else
        legal_moves << move_up[0]
      end
      legal_moves << move_diagonal_up_right[0]
      legal_moves << move_diagonal_up_left[0]
    elsif @color == 'black'
      if @position[0] == 1 #starting position
        down = move_down
        legal_moves << [down[0], down[1]]
      else
        legal_moves << move_down[0]
      end
      legal_moves << move_diagonal_down_right[0]
      legal_moves << move_diagonal_down_left[0]
    end
  end

end