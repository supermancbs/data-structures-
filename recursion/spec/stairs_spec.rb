require_relative "../stairs.rb"
require "rspec"

describe "stairs" do
  # big O 3^n
  it "returns all possible combinations of 1, 2, 3" do
    expect(stairs(4)).to eql(7)
  end

  it "returns all possible combinations of 1, 2, 3" do
    expect(stairs(3)).to eql(4)
  end

  it "returns all possible combinations faster of 1, 2, 3" do
    expect(stairs_iterate(36)).to eql(2082876103)
  end
end
