class RenameCartItemsName < ActiveRecord::Migration[5.0]
  def change
    rename_table :cart_items, :cart_item
  end
end
