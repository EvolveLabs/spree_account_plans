module Spree
  Product.class_eval do
    has_many :subscriptions

    delegate :interval_length, to: :master

    scope :subscribable, -> { where(subscribable: true) }
    scope :unsubscribable, -> { where(subscribable: false) }
  end
end