require_relative "board"
require_relative "player"

class Game

  def initialize(player, size = 4)
    @player = player

    @board = Board.new(size)
    @guess1 = nil
    @guess2 = nil
  end

  def play
    @board.render
    sleep(1)
    system("clear")

    hide_all

    @board.render


    until @board.won?
      system("clear")
      @board.render
      @guess1 = @player.get_input

      valid_input(@guess1)


      turn_card(@guess1)
      @board.render
      @guess2 = @player.get_input
      valid_input(@guess2)

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

  def valid_input(guess)
    until valid_play?(guess) == true
      puts "Invalid input, try again"
      guess = @player.get_input
    end
  end

  def hide_all
    @board.grid.each do |row|
      row.each do |card|
        card.hide
      end
    end
  end

  # def valid_input(pos)
  #
  #   until valid_play?(pos) == true
  #     puts "Please enter a valid coordinate (x, y)"
  #     pos = gets.chomp.split(',').map(&:to_i)
  #   end
  # end

  def turn_card(guess)
    @board[guess].reveal
    @player.store_cards(guess, @board[guess].value)
    p @player.store
  end

  def match?(guess1, guess2)
    @board[guess1].value == @board[guess2].value
  end

  def valid_play?(pos)
    if pos[0] > @board.size - 1 || pos[1] >  @board.size - 1
      valid1 = false
    end
    if @board[pos].face_up == true
      valid2 = false
    end

    valid1 && valid2
  end

end

if __FILE__ == $PROGRAM_NAME
  # player = HumanPlayer.new
  player = ComputerPlayer.new
  game = Game.new(player, 4)
  game.play
end
