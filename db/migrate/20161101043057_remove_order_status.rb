class RemoveOrderStatus < ActiveRecord::Migration[5.0]
  def change
  	remove_column :orders, :status
  end
end
