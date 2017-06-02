class AddCategoryToMenu < ActiveRecord::Migration[5.0]
  def change
     add_column :menus, :category_name, :string
  end
end
