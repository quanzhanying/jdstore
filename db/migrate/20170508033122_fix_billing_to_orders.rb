class FixBillingToOrders < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :builling_name, :billing_name
    rename_column :orders, :builling_address, :billing_address
  end
end
