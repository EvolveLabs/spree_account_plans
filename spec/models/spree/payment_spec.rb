require 'spec_helper'

describe Spree::Payment, :type => :model do
  let(:payment)   { create(:payment) }
  let(:order)     { create(:order_with_subscription) }

  before do
    payment.order = order
    payment.save
  end

  it "creates subscriptions after completed" do
    expect(payment.order).to receive(:create_subscriptions).and_call_original
    expect(Spree::Subscription).to receive(:create_or_extend!).and_call_original
    payment.process!
    payment.purchase!
    expect(Spree::Subscription.where(user: payment.order.user).count).to eq 1
  end
end
