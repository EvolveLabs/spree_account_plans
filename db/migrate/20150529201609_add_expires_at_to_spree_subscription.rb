class AddExpiresAtToSpreeSubscription < ActiveRecord::Migration
  def change
    add_column :spree_subscriptions, :expires_at, :datetime
  end
end
