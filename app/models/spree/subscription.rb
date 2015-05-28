class Spree::Subscription < ActiveRecord::Base
  include ::AASM

  belongs_to :variant
  delegate :product, to: :variant
  belongs_to :user

  aasm do
    state :created, initial: true
    state :active
    state :cancelled

    event :renew do
      transitions from: [:created, :active], to: :active, guard: :process_renewal
    end
  end

  private

  def process_renewal
    new_order = Spree::Order.new(user: user, bill_address: user.bill_address)
    new_order.line_items << Spree::LineItem.new(variant: variant)
    new_order.save!
  end
end
