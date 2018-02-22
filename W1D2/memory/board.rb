require_relative "card"

class Board
  attr_accessor :size, :grid

  def initialize(size = 4)
    @grid = Array.new(size) { Array.new(size) }
    @size = size
    populate
  end

  def [](pos)
    row, col = pos
    @grid[col][row]
  end

  def []=(pos, value)
    row, col = pos
    @grid[col][row] = value
  end

  def hide(pos)
    self[pos].hide
  end

  def reveal(pos)
    self[pos].reveal
  end


  def populate
    num_pairs = (size ** 2) / 2
    cards = Card.shuffled(num_pairs)
    @grid.each_index do |x|
      @grid[x].each_index do |y|
        self[[x, y]] = cards.pop
      end
    end
  end

  def render
    puts "  #{(0...size).to_a.join(' ')}"
    @grid.each_with_index do |row, idx|
      puts "#{idx} #{row.join(" ")}"
    end
  end



  def won?
    @grid.each do |row|
      row.each do |card|
        return false if !card.face_up
      end
    end
    true
  end

end
