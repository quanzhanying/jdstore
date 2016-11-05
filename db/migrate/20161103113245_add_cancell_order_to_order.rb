class AddCancellOrderToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :cancell_order, :boolean, default: true
  end
end
