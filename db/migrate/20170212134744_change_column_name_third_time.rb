class ChangeColumnNameThirdTime < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :descritption, :description
  end
end
