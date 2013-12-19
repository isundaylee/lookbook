require 'spec_helper'

describe Category do

  it "should be valid with appropriate info" do
    expect(build(:category)).to be_valid
  end

  it "should not be valid without a title" do
    expect(build(:category, title: '')).to_not be_valid
  end

  it "should not be valid without a name" do
    expect(build(:category, name: '')).to_not be_valid
  end

  it "should not allow whitespaces in a name" do
    expect(build(:category, name: '2013 winter')).to_not be_valid
  end

  it { should have_many(:children).class_name('Category') }
  it { should belong_to(:parent).class_name('Category') }

  it "allow root categories' parent to be nil" do
    expect(build(:category, parent_id: nil)).to be_valid
  end

  it "should set its children's parent to itself" do
    child = build(:category)
    parent = create(:category)
    parent.children << child
    parent.save
    expect(child.parent).to eq(parent)
  end

  it "should allow two categories with different parents to share the same name" do
    parent1 = create(:category, name: 'p1')
    parent2 = create(:category, name: 'p2')
    child1 = build(:category, name: 'a')
    child2 = build(:category, name: 'a')
    parent1.children << child1
    parent2.children << child2
    expect(child1).to be_valid
    child1.save
    expect(child2).to be_valid
  end

  it "should not allow two child categories to have the same name" do
    child1 = build(:category, name: 'a')
    child2 = build(:category, name: 'a')
    parent = build(:category, name: 'b')
    parent.children << child1
    parent.save
    parent.children << child2
    expect(child2).to_not be_valid
  end


end