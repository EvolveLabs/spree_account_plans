require 'spec_helper'

describe Spree::Subscription do
  let(:subscription)    { build(:subscription) }

  it "should have a product" do
    expect(subscription.product).to_not be_nil
  end

  it "should have a default state" do
    expect(subscription.created?).to eq true
  end

  it "should belong to a user" do
    expect(subscription.user).to_not be_nil
  end

  it "can be renewed" do
    expect{
      subscription.renew!
    }.to_not raise_error
  end

end
