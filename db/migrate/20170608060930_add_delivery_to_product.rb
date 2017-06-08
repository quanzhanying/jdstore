class AddDeliveryToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :delivery, :integer
  end
end
