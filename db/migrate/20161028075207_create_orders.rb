class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :product
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
  end
end
