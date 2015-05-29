require 'spec_helper'

describe Spree::Subscription do
  let(:subscription)            { build(:subscription) }
  let(:expired_subscription)    { build(:expired_subscription) }

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

  it "correctly detects when expired" do
    expect(subscription.needs_renewal?).to eq false
    expect(expired_subscription.needs_renewal?).to eq true
  end

  it "doesn't process a renewal if not expired" do
    expect(subscription).to_not receive(:renew!)
    subscription.process_renewal_if_necessary
  end

  it "processes a renewal if expired" do
    expect(expired_subscription).to receive(:renew!)
    expired_subscription.process_renewal_if_necessary
  end

end
