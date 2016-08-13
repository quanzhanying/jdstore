class AddProductListIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :product_list_id, :integer
  end
end
