class AddTokenToProductImage < ActiveRecord::Migration[5.0]
  def change
    add_column :product_images, :token, :string
  end
end
