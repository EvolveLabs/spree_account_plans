class AddProductIdToSpreeSubscription < ActiveRecord::Migration
  def change
    add_column :spree_subscriptions, :product_id, :integer
  end
end
