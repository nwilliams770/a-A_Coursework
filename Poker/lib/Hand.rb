require_relative 'Card'
require "rspec"
class Hand

  HANDS = {
    :Royal_Flush => 10,
    :Straight_Flush => 9,
    :Four_Kind => 8,
    :Full_house => 7,
    :Flush => 6,
    :Straight => 5,
    :Three_kind => 4,
    :Two_Pair => 3,
    :Pair => 2
  }

  def initialize
  end

  def extract(hand)
    result = []
    hand.each do |card|
      result << [card.suit, card.value]
    end

    result
  end

end
