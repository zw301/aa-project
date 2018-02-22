class HumanPlayer

  def initialize
  end
  def get_input
    pos = nil
    puts "choose a position (x, y)"
    pos = gets.chomp
    parse(pos)
  end

  def parse(pos)
    pos.split(',').map(&:to_i)
  end

end

class ComputerPlayer
  attr_reader :size, :store

  def initialize(size = 4)
    @size = size
    @store = {}
    @known_pair = []
    @flag = false
  end

  def random_guess
    x = rand(size)
    y = rand(size)
    [x, y]
  end

  # def valid_input(pos)
  #   if
  # end


  def store_cards(pos, value)
    # @store[pos] = card.value
    @store[pos] = value
  end

  def get_input
    if known_match?
      if @flag
        @store.delete(@known_pair[0], @known_pair[1])
        input = @known_pair[1]
        @flag = false
        @known_pair = []

        input
      else
        @known_pair[0]
      end
    else
      random_guess
    end
  end

  def known_match
    @store.each do |k1, v1|
      @store.each do |k2, v2|
        if k1 < k2 && v1 == v2
          @known_pair[0] = k1
          @known_pair[1] = k2
          return
        end
      end
    end
  end

  def known_match?
    !@known_pair.empty?
  end


end
