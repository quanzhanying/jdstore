class RenameProductColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :quantity, :quantity
  end
end
