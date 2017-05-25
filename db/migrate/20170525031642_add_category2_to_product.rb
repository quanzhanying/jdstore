class AddCategory2ToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :category2, :string
  end
end
