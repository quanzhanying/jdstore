class AddCategory3ToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :category3, :string
  end
end
