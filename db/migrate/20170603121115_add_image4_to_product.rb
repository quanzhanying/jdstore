class AddImage4ToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :image4, :string
  end
end
