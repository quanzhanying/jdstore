class AddMoreDetailToProduct < ActiveRecord::Migration[5.0]
  def change
     change_column :products, :quantity, :integer
     change_column :products, :price, :integer

  end
end
