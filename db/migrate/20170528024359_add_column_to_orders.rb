class AddColumnToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :shipping_phone, :string 
  end
end
