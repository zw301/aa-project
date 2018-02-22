class Game

  attr_accessor :piles

  def initialize
    @piles = [[1,2,3], [], []]
  end

  def get_input
    puts "Type the pile you want to remove(0,1,2):"
    from_pile_index = gets.chomp.to_i

    puts "Type the pile you want to put(0,1,2):"
    to_pile_index = gets.chomp.to_i

    [from_pile_index, to_pile_index]
  end

  def display
    # until won?
    #   puts "Type the pile you want to remove(0,1,2):"
    #   from_pile_index = gets.chomp.to_i
    #
    #   puts "Type the pile you want to put(0,1,2):"
    #   to_pile_index = gets.chomp.to_i
    #
    #   if valid_move?(from_pile_index, to_pile_index)
    #     piles[to_pile_index] << piles[from_pile_index].pop
    #     display
    #   else
    #     puts "Invalid input. Try again"
    #
    #   end
    # end

    until won?
      render
      from_pile_index, to_pile_index = get_input
      move(from_pile_index, to_pile_index)
    end
    render
    puts "You won!"
  end

  def move(from, to)
    piles[to] << piles[from].pop if valid_move?(from, to)
  end

  def won?
    piles[0].empty? && piles[1..2].any? {|pile| pile.length == 3}
  end

  def valid_move?(from, to)
    if piles[from].empty? || (piles[from].last && piles[to].last && piles[from].last > piles[to].last)
      raise "This is an invalid move"
    end
    true
  end

  def render
    piles.each_with_index do |pile, idx|
      puts "Tower #{idx} : #{pile.join(" ")}"
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.display
end
