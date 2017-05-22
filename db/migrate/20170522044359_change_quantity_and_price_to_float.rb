class ChangeQuantityAndPriceToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :quantity, :float
    change_column :products, :price, :float
  end
end
