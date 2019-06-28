require 'chess_piece.rb'

class Knight < ChessPiece
  attr_accessor :number

  def initialize(position, color, number)
    super(position, color)
    @figure = figure_color
    @number = number
  end

  def figure_color
    if @color == 'white'
      "\u2658".force_encoding('utf-8')
    else 
      "\u265E".force_encoding('utf-8')
    end
  end

  def moves
    row = @position[0]
    col = @position[1]
    legal_moves = []

    if (row + 2 <= 7) && (col + 1 <= 7)
      legal_moves << [row + 2, col +1]
    end

    if (row + 2 <= 7) && (col - 1 >= 0)
      legal_moves << [row + 2, col - 1]
    end

    if (row - 2 >= 0) && (col + 1 <= 7)
      legal_moves << [row - 2, col + 1]
    end

    if (row - 2 >= 0) && (col - 1 >= 0)
      legal_moves << [row - 2, col - 1]
    end

    if (row + 1 <= 7) && (col + 2 <= 7)
      legal_moves << [row + 1, col + 2]
    end

    if (row + 1 <= 7) && (col - 2 >= 0)
      legal_moves << [row + 1, col - 2]
    end

    if (row - 1 >= 0) && (col + 2 <= 7)
      legal_moves << [row - 1, col + 2]
    end

    if (row - 1 >= 0) && (col - 2 >= 0)
      legal_moves << [row - 1, col - 2]
    end

    legal_moves
  end

end