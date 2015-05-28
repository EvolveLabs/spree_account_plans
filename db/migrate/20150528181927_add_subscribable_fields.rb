class AddSubscribableFields < ActiveRecord::Migration
  def change
    add_column :spree_products, :subscribable, :boolean, default: false
    add_column :spree_variants, :interval_length, :integer, default: 1
  end
end
