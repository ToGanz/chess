#require 'chess_piece.rb'

class ChessPiece
  attr_accessor :position, :color, :figure

  def initialize(position, color)
    @position = position
    @color = color
    @figure = ' '
  end

  # def blocked_by(position)
  #   if @board.grid[position[0]][position[1]].color ==  @color
  #     'own'
  #   elsif @board.grid[position[0]][position[1]].color == @color
  #     'enemy'
  #   else
  #     false
  #   end
  # end

  def move_up
    row = @position[0]
    col = @position[1]
    legal_moves = []
    (row-1).downto(0) do |idx|
      legal_moves << [idx, col]
    end
    legal_moves
  end

  def move_down
    row = @position[0]
    col = @position[1]
    legal_moves = []
    (row+1).upto(7) do |idx|
      legal_moves << [idx, col]
    end
    legal_moves
  end

  def move_left
    row = @position[0]
    col = @position[1]
    legal_moves = []
    (col-1).downto(0) do |idx|
      legal_moves << [row, idx]
    end
    legal_moves
  end

  def move_right
    row = @position[0]
    col = @position[1]
    legal_moves = []
    (col+1).upto(7) do |idx|
      legal_moves << [row, idx]
    end
    legal_moves
  end

  def move_diagonal_up_right
    row = @position[0]
    col = @position[1]
    legal_moves = []
    [row, 7-col].min.times do |idx|
    #row.times do |idx|
      legal_moves << [row - idx - 1, col + idx + 1]
    end
    legal_moves
  end

  def move_diagonal_down_right
    row = @position[0]
    col = @position[1]
    legal_moves = []
    [7-row, 7-col].min.times do |idx|
      legal_moves << [row + idx + 1, col + idx + 1]
    end
    legal_moves
  end

  def move_diagonal_up_left
    row = @position[0]
    col = @position[1]
    legal_moves = []
    [row, col].min.times do |idx|
      legal_moves << [row - idx - 1, col - idx - 1]
    end
    legal_moves
  end

  def move_diagonal_down_left
    row = @position[0]
    col = @position[1]
    legal_moves = []
    [7-row, col].min.times do |idx|
      legal_moves << [row + idx + 1, col - idx - 1]
    end
    legal_moves
  end

end
