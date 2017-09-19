class AddMoreDetailToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :price, :integer
    add_column :products, :quantity, :integer
    add_column :products, :is_hidden, :boolean, default: true
    add_column :products, :picture, :string
  end
end
