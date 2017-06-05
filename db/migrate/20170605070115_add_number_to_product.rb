class AddNumberToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :number, :string
  end
  # add_index :products, [:status, :category_id]
  # add_index :products, [:category_id]
  # add_index :products, [:number], unique: true
  # add_index :products, [:name]
end
