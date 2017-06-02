class AddMapDetailToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :cp_lng, :string
    add_column :products, :cp_lat, :string
  end
end
