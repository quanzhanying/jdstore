class AddStyleToProductList < ActiveRecord::Migration[5.0]
  def change
    add_column :product_lists, :style, :string
  end
end
