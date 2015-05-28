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
      transitions from: [:created, :active], to: :active
    end
  end
end
