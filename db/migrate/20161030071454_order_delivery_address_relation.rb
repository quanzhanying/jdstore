class OrderDeliveryAddressRelation < ActiveRecord::Migration[5.0]
  def change
  	add_column :orders, :delivery_address_id, :integer
  end
end
