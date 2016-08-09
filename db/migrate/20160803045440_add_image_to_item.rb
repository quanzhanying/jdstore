class AddImageToItem < ActiveRecord::Migration[5.0]
  def change
  	add_column :items, :image, :string
  end
end
