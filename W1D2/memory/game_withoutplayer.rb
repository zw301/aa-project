require_relative "board"

class Game

  def initialize(player, size = 4)
    @player = player

    @board = Board.new(size)
    @guess1 = nil
    @guess2 = nil
  end

  def play
    @board.render
    sleep(5)
    system("clear")

    hide_all

    @board.render


    until @board.won?
      system("clear")
        @board.render
      @guess1 = get_input


      turn_card(@guess1)
      @board.render
      @guess2 = get_input

      turn_card(@guess2)
      @board.render

      unless match?(@guess1, @guess2)
        @board[@guess1].hide
        @board[@guess2].hide
      end
      # if match?(@guess1, @guess2)
      #   @board[@guess1].reveal
      #   @board[@guess2].reveal
      #   @board.render
      # else
      #   @board[@guess1].hide
      #   @board[@guess2].hide
      # end

    end

    puts "You won!"
  end

  def get_input
    pos = nil
    puts "choose a position (x, y)"
    pos = gets.chomp.split(',').map(&:to_i)
    until valid_play?(pos) == true
      puts "Please enter a valid coordinate (x, y)"
      pos = gets.chomp.split(',').map(&:to_i)
    end

    pos
  end

  def hide_all
    @board.grid.each do |row|
      row.each do |card|
        card.hide
      end
    end
  end


  def turn_card(guess)
    @board[guess].reveal
  end

  def match?(guess1, guess2)
    @board[guess1].value == @board[guess2].value
  end

  def valid_play?(pos)
    if pos[0] > @board.size - 1 || pos[1] >  @board.size - 1
      return false
    end
    true
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Game.new(4)
  game.play
end
