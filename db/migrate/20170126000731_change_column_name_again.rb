class ChangeColumnNameAgain < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :quanlity, :quantity
  end
end
