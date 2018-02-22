class Card
  attr_accessor :face_up, :value

  CARD_VALUE = ("a".."z").to_a

  def self.shuffled(num_pairs)
    deck = CARD_VALUE
    while num_pairs > deck.length
      deck = deck + deck
    end

    deck = CARD_VALUE.shuffle.take(num_pairs) * 2
    deck.shuffle!
    deck.map { |val| self.new(val) }
  end

  def initialize(value, face_up = true)
    @value = value
    @face_up = true
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def to_s
    @face_up ? @value.to_s : " "
  end

  def ==(object)
    self.value == object.value
  end

end
