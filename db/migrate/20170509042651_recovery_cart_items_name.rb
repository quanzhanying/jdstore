class RecoveryCartItemsName < ActiveRecord::Migration[5.0]
  def change
    rename_table :cart_item, :cart_itesm
  end
end
