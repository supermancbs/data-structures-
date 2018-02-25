require_relative "../hopper.rb"
require "rspec"

describe "stairs" do

  it "returns minimum number of jumps faster" do
    expect(hopper_dynamic([1, 3, 5, 8, 9, 2, 6, 7, 6, 8, 9])).to eql(3)
  end

  it "returns minimum number of jumps slower" do
    expect(hopper_recursion([1, 3, 5, 8, 9, 2, 6, 7, 6, 8, 9])).to eql(3)
  end
end
