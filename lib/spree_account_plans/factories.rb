FactoryGirl.define do
  factory :subscription, class: Spree::Subscription do
    association :variant, factory: :subscribable_variant
    association :user, factory: :user_with_addresses
    expires_at    { 1.day.from_now }
  end

  factory :expired_subscription, parent: :subscription do
    expires_at    { 1.day.ago }
  end

  factory :subscribable_product, parent: :base_product do
    subscribable true
  end

  factory :subscribable_line_item, parent: :line_item do
    association :variant, factory: :subscribable_variant
  end

  factory :subscribable_variant, parent: :variant do
    association :product, factory: :subscribable_product
    interval_length 3
  end

  factory :order_with_subscription, parent: :order do
    after(:create) do |order|
      order.line_items << create(:subscribable_line_item)
      order.line_items.reload
    end
  end
end
