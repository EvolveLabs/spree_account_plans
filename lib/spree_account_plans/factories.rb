FactoryGirl.define do
  factory :subscription, class: Spree::Subscription do
    association :variant, factory: :subscribable_variant
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
end
