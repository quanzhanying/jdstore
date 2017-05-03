class RenameColumnDescritpion < ActiveRecord::Migration[5.0]
  def change
  	rename_column :products, :descritpion, :description
  end
end
