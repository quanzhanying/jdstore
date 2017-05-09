class RecoveryCartItemsName2 < ActiveRecord::Migration[5.0]
  def change
    rename_table :cart_itesm, :cart_items
  end
end
