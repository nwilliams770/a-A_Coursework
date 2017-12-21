require "Deck"
require "rspec"

RSpec.describe Deck do
  subject(:deck) {Deck.new}

  # before(:each) do
  #   deck.make_deck
  # end

  describe "#create_deck" do
    it "outputs an array" do
      a = deck.create_deck
      expect(a).to be_a(Array)
    end

    it "outputs 52 cards" do
      a = deck.create_deck
      expect(a.count).to be(52)
    end

    it "outputs all unique cards" do
      a = deck.create_deck
      b = a.map { |el| [el.suit, el.value]}
      c = b.uniq
      expect(c).to eq(b)
    end
  end

  describe "#shuffle" do
    before(:each) do
      deck.create_deck
    end

    it "shuffles the deck uniquely" do
      expect(deck.shuffle_deck).to_not eq(deck)
    end




  end

end
