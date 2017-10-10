DISPLAY = {
  'Pawn' => 'P',
  'Knight' => 'N',
  'Queen' => 'Q',
  'Bishop' => 'B',
  'Rook' => 'R',
  'King' => 'K',
  ' ' => ' '
}

class Piece

  attr_reader :name, :symbol

  def initialize(name)
    @name = name
    @symbol = DISPLAY[name]
  end

end

class NullPiece < Piece
  def initialize(name)
    super
  end
end
