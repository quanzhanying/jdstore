class AddPriceUnitToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :pricd_unit, :string, default: '元'
  end
end
