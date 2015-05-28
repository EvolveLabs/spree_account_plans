class CreateSpreeSubscriptions < ActiveRecord::Migration
  def change
    create_table :spree_subscriptions do |t|
      t.boolean :auto_renew
      t.datetime :renewed_at
      t.integer :user_id
      t.integer :variant_id
      t.string :aasm_state
    end
  end
end
