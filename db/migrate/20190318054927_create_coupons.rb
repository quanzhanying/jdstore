class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.string :title
      t.integer :price
      t.integer :start_at
      t.integer :expire_at
      t.boolean :is_online
      t.string :status

      t.timestamps
    end
  end
end
