class AddAddressDetailsToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :province, :string
    add_column :orders, :city, :string
    add_column :orders, :district, :string
  end
end
