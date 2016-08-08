class DropProductList < ActiveRecord::Migration[5.0]
  def change
    drop_table :product_lists
  end
end
