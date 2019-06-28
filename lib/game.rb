require './lib/chess_piece.rb'
require './lib/king.rb'
require './lib/queen.rb'
require './lib/rook.rb'
require './lib/bishop.rb'
require './lib/knight.rb'
require './lib/pawn.rb'
require './lib/board.rb'
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
    puts "#{@active_player.upcase}: Choose the position of the figure you want to move"
    input = gets.chomp
    input = input.split(', ')
    if !ROW_NAMES.include?(input[0].to_i) 
      puts "Not a valid option. Choose: row, col !"
      return false 
    end
    if !COL_NAMES.include?(input[1])
      puts "Not a valid option. Choose: row, col !"
      return false 
    end
    row = ROW_NAMES.index(input[0].to_i)
    col = COL_NAMES.index(input[1])
    if @board.grid[row][col].color != @active_player
      puts "Not a valid option. Choose your own figure!"
      return false 
    end
    from = [row, col]
  end

  def get_input_to
    puts "#{@active_player.upcase}: Choose the position you want to move to"
    input = gets.chomp
    input = input.split(', ')
    if !ROW_NAMES.include?(input[0].to_i) 
      puts "Not a valid option. Choose: row, col !"
      return false 
    end
    if !COL_NAMES.include?(input[1])
      puts "Not a valid option. Choose: row, col !"
      return false 
    end
    row = ROW_NAMES.index(input[0].to_i)
    col = COL_NAMES.index(input[1])
    to = [row, col]
  end

  def play
    while game_over? == false
      @board.display
      from = false
      while from == false
        from = get_input_from
      end

      to = false
      while to == false
        to = get_input_to
      end

      if @board.possible_move?(from, to)
        @board.move(from, to)
        @turn += 1
        swap_players
        game_over?
      else
        puts "What is this? Choose a legal move!"
      end
      
    end
    @board.display
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

game1 = Game.new

game1.play