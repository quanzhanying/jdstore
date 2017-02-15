class AddIsHiddenToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :is_hidden, :boolean, default: false
  end
end
