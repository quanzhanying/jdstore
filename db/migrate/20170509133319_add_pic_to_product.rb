class AddPicToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :pic, :string
  end
end
