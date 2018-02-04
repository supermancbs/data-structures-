require 'rspec'
require_relative '../coin_change'

describe "coin_change" do
  it "returns coin combo" do
    expect(coin_change(4, [1, 2, 3])).to eql(4)
  end

  it "returns coin combo" do
    expect(coin_change(4, [1, 2, 3])).to eql(4)
  end
end
