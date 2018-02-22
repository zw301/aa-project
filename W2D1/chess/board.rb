require_relative 'piece.rb'

require 'byebug'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.new(:none)} }
    self.setup(:white)
    self.setup(:black)
  end

  def display
    self.grid.each do |row|
      puts row.map { |el| el.symbol }.inspect
    end
  end

  def setup(color)
    if color == :white
      row_number = [-1, -2]
    else
      row_number = [0, 1]
    end

    piece_classes = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    piece_classes.each_with_index do |piece_class, i|
      self[[row_number.first, i]] = piece_class.new(color)
    end

    8.times {|i| self[[row_number.last, i]] = Pawn.new(color) }
  end


  def move_piece(start_pos, end_pos)
    current_piece = self[start_pos]
    to_move = self[end_pos]

    # checks if its a valid move, if not then raise error, end program.
    if current_piece.is_a?(NullPiece)
      raise "There is no piece here."
    elsif to_move.is_a?(NullPiece) == false
      raise "You cant move here."
    end

    self[start_pos] = NullPiece.new(:none)
    self[end_pos] = current_piece
  end

  def [](pos)
    row, col = pos
    self.grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    self.grid[row][col] = value
  end
end

board = Board.new
board.display
# board.move_piece([1,0], [3, 0])
# board.display
