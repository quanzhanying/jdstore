class AddShipToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :ship, :boolean, default: false
  end
end
