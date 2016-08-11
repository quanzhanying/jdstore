class ChangeColumnNameInItemList < ActiveRecord::Migration[5.0]
  def change
    rename_column :item_lists, :product_name, :item_name
    rename_column :item_lists, :product_price, :item_price
  end
end
