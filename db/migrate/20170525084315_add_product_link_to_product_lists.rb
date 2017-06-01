class AddProductLinkToProductLists < ActiveRecord::Migration[5.0]
  def change
    add_column :product_lists, :product_link, :string 
  end
end
