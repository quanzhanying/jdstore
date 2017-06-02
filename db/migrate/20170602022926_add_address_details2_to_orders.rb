class AddAddressDetails2ToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :billing_province, :string
    add_column :orders, :billing_city, :string
    add_column :orders, :billing_district, :string
  end
end
