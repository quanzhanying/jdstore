class RenameQualityToQuantity < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :quality, :quantity
  end
end
