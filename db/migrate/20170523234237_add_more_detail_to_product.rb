class AddMoreDetailToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :sale_count, :integer
  end
end
