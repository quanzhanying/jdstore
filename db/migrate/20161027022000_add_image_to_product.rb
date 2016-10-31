class AddImageToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :product, :image, :string
  end
end
