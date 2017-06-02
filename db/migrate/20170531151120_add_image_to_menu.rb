class AddImageToMenu < ActiveRecord::Migration[5.0]
  def change
     add_column :menus, :image, :string
  end
end
