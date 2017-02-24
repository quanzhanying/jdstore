class AddMoreDetailToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :shirt_name, :string
    add_column :products, :sweatre_name, :string
    add_column :products, :jean_name, :string
    add_column :products, :jacket_name, :string
    add_column :products, :is_shirt, :boolean, default: true
    add_column :products, :is_sweatre, :boolean, default: true
    add_column :products, :is_jean, :boolean, default: true
    add_column :products, :is_jacket, :boolean, default: true
    add_column :products, :is_hidden, :boolean, default: true
  end
end
