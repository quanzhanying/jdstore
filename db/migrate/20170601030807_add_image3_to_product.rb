class AddImage3ToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :image3, :string
  end
end
