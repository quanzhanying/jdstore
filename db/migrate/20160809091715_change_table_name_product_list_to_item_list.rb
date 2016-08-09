class ChangeTableNameProductListToItemList < ActiveRecord::Migration[5.0]
  def change
    rename_table :product_lists, :item_lists
  end
end
