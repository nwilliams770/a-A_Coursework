require 'rspec_practice'
require 'rspec'

  RSpec.describe "my_uniq" do
    it "removes duplicate elements" do
      expect(my_uniq([1,1,2,2,3,3])).to eq([1,2,3])
    end

    it "raises error if input is not an array" do
      expect{ my_uniq("1 1 2 3") }.to raise_error(ArgumentError)
    end

    it "outputs an array" do
      expect(my_uniq([1,2,3])).to be_a(Array)
    end

    #ask TA on how to store inputs
    it "does not modify original array" do
      a = [1,1,2,2,3,3]
      my_uniq(a)
      expect(a).to eq([1,1,2,2,3,3])
    end


  end

  describe "two_sum" do
    it "returns indexes when two els sum to 0" do
      expect(two_sum([2,-2,1])).to eq([[0,1]])
    end

    it "orders paired indexes from smaller to larger" do
      expect(two_sum([2,-2,1])).to eq([[0,1]])
    end

    it "returns a nested array" do
      a = two_sum([2,-2,1]).all? {|el| el.is_a?(Array) }
      expect(a).to be(true)
    end
  end

  describe "my_transpose" do
    it " transposes rows to colums" do
      expect(my_transpose([[0,1,2], [3,4,5], [6,7,8]])).
      to eq([[0,3,6], [1,4,7], [2,5,8]])
    end
  end

  describe "wallst_monster" do
    it "gets the best profit with the lowest moral integrity" do
      expect(wallst_monster([1.0, 1.25, 2.50, 2])).to eq([0,2])
    end
  end
