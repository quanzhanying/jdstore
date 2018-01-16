class AddShippingProvinceCityDistrictPhoneToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :shipping_province, :string
    add_column :orders, :shipping_city, :string
    add_column :orders, :shipping_district, :string
    add_column :orders, :shipping_phone, :string
  end
end
