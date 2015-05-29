module Spree
  Order.class_eval do
    def create_subscriptions
      line_items.each do |line_item|
        if line_item.variant.subscribable?
          Subscription.create_or_extend!(
            product: line_item.variant.product,
            user: user,
            variant: line_item.variant,
            credit_card: payments.from_credit_card.first.source
          )
        end
      end
    end
  end
end
