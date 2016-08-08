class AddColumnsToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :title, :string
    add_column :products, :description, :text
    add_column :products, :quantity, :integer
    add_column :products, :price, :float
    add_column :products, :image, :string
  end
end
