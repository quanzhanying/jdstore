class ChangeProductsQuantityToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :quantity, :integer
  end
end
