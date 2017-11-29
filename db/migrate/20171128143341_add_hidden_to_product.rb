class AddHiddenToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :is_hidden, :boolean, defualt: true
  end
end
