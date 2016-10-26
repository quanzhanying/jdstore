class CreateProductions < ActiveRecord::Migration[5.0]
  def change
    create_table :productions do |t|
      t.string :title
      t.string :description
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
