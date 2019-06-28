require './lib/chess_piece.rb'
require_relative 'king.rb'
require_relative 'queen.rb'
require_relative 'rook.rb'
require_relative 'bishop.rb'
require_relative 'knight.rb'
require_relative 'pawn.rb'

class Board
  attr_accessor :grid

  COL_NAMES = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
  ROW_NAMES = [1, 2, 3, 4, 5, 6, 7, 8]
  def initialize
    @grid = setup_board
  end

  def setup_board
    board = Array.new(8) { Array.new(8) { ' ' } }
    2.upto(5) do |row|
      8.times do |col|
        board[row][col] = ChessPiece.new([row, col], 'empty')
      end
    end
    #black
    board[0][0] = Rook.new([0, 0], 'black', 1)
    board[0][1] = Knight.new([0, 1], 'black', 1)
    board[0][2] = Bishop.new([0, 2], 'black', 1)
    board[0][3] = Queen.new([0, 3], 'black', 1)
    board[0][4] = King.new([0, 4], 'black', 1)
    board[0][5] = Bishop.new([0, 5], 'black', 2)
    board[0][6] = Knight.new([0, 6], 'black', 2)
    board[0][7] = Rook.new([0, 7], 'black', 2)
    8.times do |col|
      board[1][col] = Pawn.new([1, col], 'black', col+1)
    end

    #white
    board[7][0] = Rook.new([7, 0], 'white', 1)
    board[7][1] = Knight.new([7, 1], 'white', 1)
    board[7][2] = Bishop.new([7, 2], 'white', 1)
    board[7][3] = King.new([7, 3], 'white', 1)
    board[7][4] = Queen.new([7, 4], 'white', 1)
    board[7][5] = Bishop.new([7, 5], 'white', 2)
    board[7][6] = Knight.new([7, 6], 'white', 2)
    board[7][7] = Rook.new([7, 7], 'white', 2)
    8.times do |col|
      board[6][col] = Pawn.new([6, col], 'white', col+1)
    end

    board
  end

  def possible_move?(from, new_position)
    piece = @grid[from[0]][from[1]]
    legal_moves = piece.moves
    legal_moves.each do |direction|
      if direction.nil? == false && direction.include?(new_position)
        array_index = direction.index(new_position)
        direction[0..array_index].each do |coordinates|
          if blocked_by(coordinates) == @grid[from[0]][from[1]].color
            return false
          elsif blocked_by(coordinates) != false
            return false if coordinates != new_position 
          end
        end
        return true
      elsif direction.nil? == false && direction == new_position 
        if blocked_by(direction) == @grid[from[0]][from[1]].color
          return false
        elsif blocked_by(direction) != false
          return false if direction != new_position 
        end
        return true
      end
    end
    false
  end

  def move(from, new_position) 
    piece = @grid[from[0]][from[1]]

    #@grid[piece.position[0]][piece.position[1]] = ChessPiece.new([piece.position[0], piece.position[1]], 'empty')
    @grid[from[0]][from[1]] = ChessPiece.new([from[0], from[1]], 'empty')
    @grid[new_position[0]][new_position[1]] = piece
    piece.position = new_position
  end

  def display
    puts ''
    puts "   a   b   c   d   e   f   g   h"
    puts " _________________________________"
    @grid.each_with_index do |row, idx|
      puts "#{ROW_NAMES[idx]}| #{row[0].figure} | #{row[1].figure} | #{row[2].figure} | #{row[3].figure} | #{row[4].figure} | #{row[5].figure} | #{row[6].figure} | #{row[7].figure} |"
      puts " |___|___|___|___|___|___|___|___|"
    end
  end

  def blocked_by(position)
    if @grid[position[0]][position[1]].color == 'white'
      'white'
    elsif @grid[position[0]][position[1]].color == 'black'
      'black'
    else
      false
    end

    
  end

end