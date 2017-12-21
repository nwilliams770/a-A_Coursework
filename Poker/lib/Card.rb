require 'rspec'

class Card
  VALUES = [2,3,4,5,6,7,8,9,10,11,12,13,14]
  SUITS = [:Hearts, :Diamonds, :Clubs, :Spades]

  attr_reader :suit, :value

  def self.suits
    SUITS
  end

  def self.values
    VALUES
  end

  def to_s
    "#{@value} of #{@suit}s"
  end

  def initialize(suit, value)
    @suit = suit
    @value = value
  end


end
