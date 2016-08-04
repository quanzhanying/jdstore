class ChangePriceTypeInProducts < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :price, :integer
  end
end
