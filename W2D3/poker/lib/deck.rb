class Deck
  attr_reader :fullcards


  def initialize
    @fullcards = []
    fillcards
  end


  def fillcards
    symbols = [:hearts, :clubs, :diamonds, :pikes]
    symbols.each do |symbol|
      (1..13).each do |i|
        if i == 1
          fullcards << Card.new(i, symbol, i)
        else
          fullcards << Card.new(i, symbol, i)
      end
    end
  end



  def shuffle
    fullcards.shuffle!
  end


end
