require_relative 'Card'

class Deck
  def initialize
    @deck = []
  end

  # SUITS = {
  #   :Diamonds => [2,3,4,5,6,7,8,9,10,11,12,13,14],
  #   :Clubs => [2,3,4,5,6,7,8,9,10,11,12,13,14],
  #   :Hearts => [2,3,4,5,6,7,8,9,10,11,12,13,14],
  #   :Spades => [2,3,4,5,6,7,8,9,10,11,12,13,14]
  # }
  #
  # VALUES = [2,3,4,5,6,7,8,9,10,11,12,13,14]
  CARD_COMBOS = [[:Hearts, :Diamonds, :Clubs, :Spades],
  [2,3,4,5,6,7,8,9,10,11,12,13,14]]
  #
  # def create_deck
  #   i = 0
  #   while i < CARD_COMBOS[0].length
  #     j = 0
  #     while j <CARD_COMBOS[1].length
  #       @deck << Card.new(CARD_COMBOS[0][i], CARD_COMBOS[1][j])
  #       j += 1
  #     end
  #     i += 1
  #   end
  #   @deck
  # end

  def create_deck
    Card.suits.each do |suit|
      Card.values.each do |value|
        @deck << Card.new(suit, value)
      end
    end
  end


  def shuffle_deck
    @deck.shuffle
  end

end
