require 'rspec'
require_relative '../coin_change'

describe "coin_change" do
  it "returns coin combo" do
    expect(coin_change(4, [1, 2, 3])).to eql(4)
  end

  it "returns coin combo" do
    expect(coin_change(10, [2, 5, 3, 6])).to eql(5)
  end

  it "memo works" do
    expect(coin_change_memo(4, [1, 2, 3])).to eql(4)
    expect(coin_change_memo(10, [2, 5, 3, 6])).to eql(5)
  end
end
