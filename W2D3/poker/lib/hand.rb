class Hand
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  #The logic of calculating pair, three-of-a-kind, two-pair, etc. goes here.
  #Logic of which hand beats which would go here.

  def count_symbol
    symbol_hash = Hash.new(0)
    cards.each do |card|
      symbol_hash[card.symbol] += 1
    end
    symbol_hash
  end

  def count_value
    value_hash = Hash.new(0)
    cards.each do |card|
      value_hash[card.priority] += 1
    end
    value_hash
  end

  def royal_flush
    count_symbol.keys.length == 1 &&
      count_value.keys.sort == [10, 11, 12, 13, 14]
  end


  def straight_flush
    values = count_value.keys
    !royal_flush && (values.min..values.max).to_a == values.sort! &&
      count_symbol.keys.length == 1
  end

  def four_of_a_kind
    count_symbol.key.length == 4 &&
      count_value.values.sort = [1, 4]
  end

  def full_house
    count_value.keys.sort == [2, 3]
  end

  def flush
    !royal_flush && !straight_flush && count_symbol.keys.length == 1
  end

  def straight
    values = count_value.keys
    !royal_flush && !straight_flush &&
      (values.min..value.max).to_a == values.sort!
  end

  def three_of_a_kind
    count_value.keys.sort = [1, 1, 3]
  end

  def two_pair
    count_value.keys.sort = [1, 2, 2]
  end

  def one_pair
    count_value.keys.sort = [1, 1, 1, 2]
  end

  def high_card
    count_value.sort.last
  end


end
