require 'spec_helper'

describe Spree::Order do
  let(:order)    { create(:order_with_subscription) }

  it "can be created with a subscription" do
    expect(order.line_items.first.subscribable_product?).to eq true
  end
end
