require 'spec_helper'

describe Category do

  it "should be valid with appropriate info" do
    expect(build(:category)).to be_valid
  end

  it "should not be valid without a title" do
    expect(build(:category, title: '')).to_not be_valid
  end

  it { should have_many(:children).class_name('Category') }
  it { should belong_to(:parent).class_name('Category') }

  it "allow root categories' parent to be nil" do
    expect(build(:category, parent_id: nil)).to be_valid
  end

  it "should set its children's parent to itself" do
    child = build(:category)
    parent = build(:category)
    parent.children << child
    parent.save
    expect(child.parent).to eq(parent)
  end

end