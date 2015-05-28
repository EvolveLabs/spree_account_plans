require 'spec_helper'

describe Spree::LineItem do
  it "tells if it has a subscribable product" do
    line_item = build(:subscribable_line_item)
    expect(line_item.subscribable_product?).to eq true
  end

  it "is invalid if quantity of subscribable product is greater than 1" do
    line_item = build(:subscribable_line_item, :quantity => 2)
    expect(line_item).to_not be_valid
  end

  it "is valid if quantity of normal product is greater than 1" do
    line_item = build(:line_item, :quantity => 2)
    expect(line_item).to be_valid
  end

  it "can be destroyed setting quantity to 0" do
    line_item = build(:subscribable_line_item, :quantity => 0)
    expect(line_item).to be_valid
  end
end