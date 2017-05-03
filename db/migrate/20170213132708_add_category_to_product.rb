class AddCategoryToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :category, :string
  end
end
