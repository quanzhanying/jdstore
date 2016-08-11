class AddImageToProductLists < ActiveRecord::Migration[5.0]
  def change
    add_column :product_lists,:image,:string
  end
end
