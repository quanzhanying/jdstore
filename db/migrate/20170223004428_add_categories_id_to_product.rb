class AddCategoriesIdToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :categories, :string
  end
end
