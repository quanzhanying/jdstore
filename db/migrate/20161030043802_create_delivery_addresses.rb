class CreateDeliveryAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :delivery_addresses do |t|
      t.string :name
      t.text :address
      t.string :phone
      t.integer :user_id

      t.timestamps
    end
  end
end
