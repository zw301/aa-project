require 'colorize'
require_relative 'cursor.rb'
require_relative 'board.rb'

class Display
  def initialize(board)
    @cursor = Cursor.new([0,0], Board.new).colorize(:green)
    @board = board
  end
end
