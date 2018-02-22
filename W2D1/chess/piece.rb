class Piece
  attr_accessor :color, :symbol
  def initialize(color)
    @symbol = set_symbol
    @color = color
  end
end

class King < Piece
  def set_symbol
    :+
  end
end

class Queen < Piece
  def set_symbol
    :Q
  end
end

class Rook < Piece
  def set_symbol
    :R
  end
end

class Knight < Piece
  def set_symbol
    :K
  end
end

class Bishop < Piece
  def set_symbol
    :B
  end
end

class Pawn < Piece
  def set_symbol
    :P
  end
end

class NullPiece < Piece
  def set_symbol
    :-
  end
end
