class ChangeDefaultQuantityInCartItem < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:cart_items, :quantity, 0)
  end
end
