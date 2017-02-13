class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :quanlity, :quanlity
  end
end
