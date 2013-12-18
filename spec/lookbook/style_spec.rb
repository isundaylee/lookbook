require 'spec_helper'

describe Style do

  it "should be valid with valid attributes" do
    expect(build(:style)).to be_valid
  end

  it "should not be valid without a title" do
    expect(build(:style, title: '')).to_not be_valid
  end

  it "should not be valid with a negative price" do
    expect(build(:style, price: -19.99)).to_not be_valid
  end

  it "should not be valid with a negative current_price" do
    expect(build(:style, current_price: -19.99)).to_not be_valid
  end

  it "should be valid even without an url" do
    expect(build(:style, url: '')).to be_valid
  end

end