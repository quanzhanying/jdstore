class ChangePriceTypeFromIntToFloatInOrder < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :total, :float, default: 0
  end
end
