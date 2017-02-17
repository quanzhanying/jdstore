class AddDefaultToProductsQuantity < ActiveRecord::Migration[5.0]
  def change
    change_column_default :products, :quantity, 1
  end
end
