require 'Hand'
require 'rspec'
require "Card"
RSpec.describe Hand do
  subject(:hand) {Hand.new}
  describe "#initialize" do
  let(:card) {double(:Hearts, 14)}

  describe "#extract" do
    it "extracts value & suit from Card object" do
      expect(hand.extract(card)).to eq([:Hearts, 14])
    end

  end

end
end
