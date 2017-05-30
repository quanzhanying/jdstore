class AddCategoryNameToProduct < ActiveRecord::Migration[5.0]
  def change
     add_column :products, :category_name, :string
  end
end
