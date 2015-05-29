class AddCreditCardToSpreeSubscriptions < ActiveRecord::Migration
  def change
    add_column :spree_subscriptions, :credit_card_id, :integer
  end
end
