require 'rspec'
require_relative '../fibonacci'

describe "fibonacci" do
  it "returns the nth fibonacci number" do
    expect(fibonacci(6)).to eql(8)
  end

  it "returns the 40th", focus: true do
    expect(memoization_fib(5)).to eql(102334155) # takes 17.47 seconds without dynamic programming (memoization)
  end
end
