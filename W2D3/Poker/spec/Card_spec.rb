require "Card"
require "rspec"

RSpec.describe Card do
  subject(:card) {Card.new(:Hearts, 14)}
  describe "#initialize" do
    # it "assigns card a name" do
    #   expect(card.name).to eq("K.Heart")
    # end

    it "assigns a value" do
      expect(card.value).to eq(14)
    end

    it "assigns a suit" do
      expect(card.suit).to eq(:Hearts)
    end

  end
end
