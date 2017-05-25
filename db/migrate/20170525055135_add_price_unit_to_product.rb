class AddPriceUnitToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :price_unit, :string
  end
end
