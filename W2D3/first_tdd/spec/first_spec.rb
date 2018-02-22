require 'rspec'
require 'first'

RSpec.describe "Array" do
  describe "Array#my_uniq" do
    let(:arr) { [2, 2, 3, 4] }
    it "removes duplicates from an array" do
      expect(arr.my_uniq).to eq([2, 3, 4])
    end

    it "return a new array" do
      expect(arr.my_uniq).to_not be(arr)
    end

    it "should not use #uniq method " do
      # expect_any_instance_of(Array).to_not receive(:uniq)
      expect(arr).to_not receive(:uniq)
      arr.my_uniq
    end

  end

  describe "Array#two_sum" do
    it "returns positions of pairs of number that add to zero" do
      expect([-5, 9, -9, 0].two_sum).to eq([[1, 2]])
    end

    it "return [] when no pair is found" do
      expect([5, 5, 6, 0].two_sum).to eq([])
    end

    it "finds all pairs of positions" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end

    it "the array of pairs to be sorted" do
      expect([-5, 5, 2, -2, 1].two_sum).to eq([[0, 1], [2, 3]])
    end
  end
end

describe "#my_transpose" do
  let(:arr1) {[[0, 1, 2], [3, 4, 5], [6, 7, 8]] }
  # let(:arr2) {[[0, 3, 6], [1, 4, 7], [2, 5, 8]] }

  let(:arr3) { [[1, 2, 3], [4, 5, 6]] }
  let(:arr4) { [[1, 4], [2, 5], [3, 6]] }
  it "transpose n*n matrix" do
    expect(my_transpose(arr1)).to eq(arr1.transpose)
  end

  it "transpose n*m matrix" do
    expect(my_transpose(arr3)).to eq(arr4)
  end

  it "should not use #transpose method " do
    expect(arr1).to_not receive(:transpose)
  end
end



describe "stock_picker" do
  let(:prices) {[0, 1, 2, 3, 6, 5, 4]}
  it "outputs the most profitable pair of days" do
    expect(stock_picker(prices)).to eq([0, 4])
  end
  it "can't sell stock before buy it" do
    expect(stock_picker(prices).sort).to eq(stock_picker(prices))
  end
end
