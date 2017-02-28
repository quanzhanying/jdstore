class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.string :title
      t.text :description
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
