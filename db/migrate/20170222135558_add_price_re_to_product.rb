class AddPriceReToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :price_re, :integer
  end
end
