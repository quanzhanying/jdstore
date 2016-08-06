class AddProductPictureToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :Product_picture, :string
  end
end
