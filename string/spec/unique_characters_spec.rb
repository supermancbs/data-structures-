require 'rspec'
require_relative '../unique_characters.rb'

describe "unique?" do
  it "returns true is unique characters in string" do
    expect(unique?('abcde')).to eql(true)
  end

  it "returns false if not unique characters in string" do
    expect(unique?('aaabcde')).to eql(false)
  end
end
