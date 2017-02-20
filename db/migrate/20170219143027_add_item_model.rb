class AddItemModel < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :model, :string
  end
end
