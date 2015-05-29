class Spree::Subscription < ActiveRecord::Base
  include ::AASM

  belongs_to :credit_card
  belongs_to :variant
  delegate :product, to: :variant
  belongs_to :user

  validates_associated :credit_card, :user

  aasm do
    state :created, initial: true
    state :active
    state :cancelled

    event :renew do
      transitions from: [:created, :active], to: :active, guard: :process_renewal
    end
    event :cancel do
      transitions from: [:created, :active], to: :cancelled
    end
  end

  def self.create_or_extend!(opts)
    opts.to_options!.assert_valid_keys(:user, :product, :variant, :credit_card)
    self.where(user: opts[:user], product_id: opts[:product]).first_or_create do |sub|
      sub.variant = opts[:variant]
      sub.credit_card = opts[:credit_card]
      # extend out renewed_at
      # and expires at
      sub.renewed_at = DateTime.now
      sub.expires_at ||= DateTime.now
      sub.expires_at += sub.variant.interval_length.months
    end
  end

  # processes a renewal, only if the subscription is expired
  def process_renewal_if_necessary
    return if !needs_renewal?
    renew!
  end

  def needs_renewal?
    expires_at < DateTime.now
  end

  private

  def process_renewal
    new_order = Spree::Order.new(user: user, bill_address: user.bill_address)
    new_order.line_items << Spree::LineItem.new(variant: variant)
    new_order.save!
  end
end
