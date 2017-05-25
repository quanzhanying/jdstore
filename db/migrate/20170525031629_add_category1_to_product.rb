class AddCategory1ToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :category1, :string
  end
end
