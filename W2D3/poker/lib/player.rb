class Player

  #Each player has a hand, plus a pot
  # Player has methods to ask the user:
  # Which cards they wish to discard
  # Whether they wish to fold, see, or raise.
  def initialize(hand, pot)
    @hand = hand
    @pot = pot
    
  end
  def bet
  end

  def fold
  end

  def check_cur_bet
  end

  def raise
  end

  def discard
  end


end
