class AddTotalToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :total, :integer, default: 0
    add_column :orders, :user_id, :integer
    add_column :orders, :billing_name, :string
    add_column :orders, :billing_address, :string
    add_column :orders, :shipping_name, :string
    add_column :orders, :shipping_address, :string
  end
end
