class AddPlaceToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :place, :string
  end
end
