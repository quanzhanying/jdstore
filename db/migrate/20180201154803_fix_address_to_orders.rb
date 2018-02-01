class FixAddressToOrders < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :shipping_addres, :shipping_address
  end
end
