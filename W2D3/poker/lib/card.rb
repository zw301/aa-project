class Card
  VALUES = {
    1 => "A",
    2 => "2",
    3 => "4",
    4 => "4",
    5 => "5",
    6 => "6",
    7 => "7",
    8 => "8",
    9 => "9",
    10 => "10",
    11 => "J",
    12 => "Q",
    13 => "K",
  }
  # VALUES = %w(A 1 2 3 4 5 6 7 8 9 10 J Q K)
  attr_reader :face, :symbol, :priority
  
  def initialize(value, symbol, priority)
    @face = get_value(value)
    @symbol = symbol
    @priority = priority
  end

  def get_value(value)
    VALUES[value]
  end

  def compare(otherCard)
    VALUES.key(self.priority) <=> VALUES.key(otherCard.priority)
  end

end
