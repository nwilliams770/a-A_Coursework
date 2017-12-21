require 'Towers'
require 'rspec'

RSpec.describe Towers do
  subject(:towers) {Towers.new}

  describe "#initialize" do
    it "creates 3 towers" do
      expect(towers.count).to eq(3)
    end

    it "puts all els in first tower"
  end
end
