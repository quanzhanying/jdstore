class AddProductParameter < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :product_parameter, :text
  end
end
