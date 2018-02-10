require 'rspec'
require_relative '../merge_sort'

describe "merge_sort" do
  it "sorts an array" do
    arr = [20, 1, 10, 38, 15, 18]
    expect(merge_sort(arr)).to eql(arr.sort)
  end
end
