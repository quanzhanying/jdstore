class AddIsShipToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders,:is_ship,:boolean,default:false
  end
end
