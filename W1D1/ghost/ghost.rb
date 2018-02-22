class Game
  attr_accessor :players, :fragment, :dictionary, :current_player

  def initialize(players)
    @players = players
    @current_player = players[0]
    @previous_player = nil
    @dictionary = File.readlines("dictionary.txt")
    @fragment = ""
    @losses = {}
    @players.each { |p| @losses[p] = 0 }
  end

  # def initialize(player1, player2)
  #   @player1, @player2 = player1, player2
  #   @dictionary = File.readlines("dictionary.txt")
  #   @fragment = ""
  #
  #   @current_player = player1
  #   @previous_player = nil
  #
  #   @losses = {
  #     player1 => 0,
  #     player2 => 0
  #   }
  # end

  def next_player!
    @previous_player = @current_player
    idx = players.index(@current_player) + 1
    idx = 0 if idx == players.length
    @current_player = players[idx]

    #@current_player = (@current_player == player1) ? player2 : player1
    #@previous_player = (@current_player == player1) ? player2 : player1
  end

  def take_turn(player)
    move = player.guess(@fragment)
    until valid_play?(move)
      move = player.guess
    end
    @fragment << move

  end

  def valid_play?(string)
    dic = ("a".."z").to_a
    @current_player.alert_invalid_guess if string.length != 1
    if dic.include?(string.downcase)
      dictionary.each do |word|
        return true if word.strip[0...fragment.length] == fragment
      end
    end
    false
  end

  # def run
  #   until @losses.values.any? { |v| v == 5 }
  #     play_round
  #   end
  #   puts "#{@previous_player.name} loses the game."
  # end

  def run
    until @players.length == 1
      until @losses.values.any? { |v| v == 5 }
        play_round
      end
      players.delete(@previous_player)
      puts "#{@previous_player.name} is eliminated."
    end

    puts "#{players[0].name} wins the game."
  end

  def play_round
    @fragment = ""
    until lose?
      take_turn(@current_player)
      next_player!
    end

    puts "You spelled '#{fragment}'"
    puts "#{@previous_player.name} loses this round!"
    @losses[@previous_player] += 1

    # puts "#{@previous_player.name} has #{record(@previous_player)}!"
    # puts "#{@current_player.name} has #{record(@current_player)}!"
    players.each do |player|
      puts "#{player.name} has #{record(player)}!"
    end

  end

  def lose?
    dictionary.each do |word|
      return true if word.strip == fragment
    end
    false
  end


  def record(player)
    str = 'GHOST'
    str[0...@losses[player]]
  end
end


class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess(fragment)
    puts "Current word is #{fragment}"
    puts "#{name}, enter move (one letter, e.g. a): "
    move = gets.chomp
  end

  def alert_invalid_guess
    print "WRONG GUESS! Try again. One letter only!\n"
  end
end

if __FILE__ == $PROGRAM_NAME
  players = [Player.new("a"), Player.new("b"), Player.new("c")]
  game = Game.new(players)
  game.run

end
