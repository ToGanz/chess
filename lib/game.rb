require 'chess_piece.rb'
require 'king.rb'
require 'queen.rb'
require 'rook.rb'
require 'bishop.rb'
require 'knight.rb'
require 'pawn.rb'
require 'board.rb'
class Game

  COL_NAMES = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
  ROW_NAMES = [1, 2, 3, 4, 5, 6, 7, 8]

  attr_accessor :board, :turn

  def initialize
    @board = Board.new
    @turn = 0
    @active_player = 'white'
  end

  def get_input_from
    puts "Choose the position of the figure you want to move"
    input = gets.chomp
    input = input.split!(', ')
    return false if !ROW_NAMES.include?(input[0].to_i) 
    return false if COL_NAMES.include?(input[1])
    row = ROW_NAMES.index(input[0].to_i)
    col = COL_NAMES.index(input[1])
    from = [row, col]
  end

  def get_input_to
    puts "Choose the position you want to move to"
    input = gets.chomp
    input = input.split!(', ')
    return false if !ROW_NAMES.include?(input[0].to_i) 
    return false if COL_NAMES.include?(input[1])
    row = ROW_NAMES.index(input[0].to_i)
    col = COL_NAMES.index(input[1])
    to = [row, col]
  end

  def play
    while game_over? == false
      swap_players
      display
      input = false
      while input == false
        input = get_input
      end
      @board.drop_piece((input.to_i - 1), @active_player.sign)
      @turn += 1
      game_over?
    end
    display
    puts "Game Over!"
  end

  #private

  def game_over?
    false
  end


  def swap_players
    if @active_player == 'white'
      @active_player = 'black'
    else
      @active_player = 'white'
    end
	end

end
