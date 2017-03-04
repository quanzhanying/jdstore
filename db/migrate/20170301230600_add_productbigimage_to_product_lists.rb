class AddProductbigimageToProductLists < ActiveRecord::Migration[5.0]
  def change
    add_column :product_lists, :productbigimage, :string
  end
end
