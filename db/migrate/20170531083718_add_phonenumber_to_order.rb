class AddPhonenumberToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :billing_phone, :integer
    add_column :orders, :shipping_phone, :integer
  end
end
