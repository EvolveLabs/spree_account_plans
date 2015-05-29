module Spree
  Product.class_eval do
    has_many :subscriptions

    delegate_belongs_to :master, :interval_length

    scope :subscribable, -> { where(subscribable: true) }
    scope :unsubscribable, -> { where(subscribable: false) }
  end
end