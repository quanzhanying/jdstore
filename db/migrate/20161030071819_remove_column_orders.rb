class RemoveColumnOrders < ActiveRecord::Migration[5.0]
  def change
  	remove_column :orders, :name
  	remove_column :orders, :address
  end
end
