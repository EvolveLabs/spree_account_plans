require 'spec_helper'

describe Spree::Product do
  let(:product) { build(:subscribable_product) }
  let(:simple_product) { build(:base_product) }

  it "should respond to subscribable method" do
    expect(product).to respond_to :subscribable
  end

  it "should be subscribable" do
    expect(product.subscribable).to eq true
  end

  it "should respond to subscribable method" do
    expect(product).to respond_to :subscribable?
  end

  it "should be subscribable" do
    expect(product.subscribable?).to eq true
  end

  it "should default to one month" do
    expect(product.interval_length).to eq 1
  end

  it "should have subscribable to false by default" do
    expect(simple_product.subscribable?).to eq false
  end
end
