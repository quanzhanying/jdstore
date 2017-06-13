class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :weight, default: 0
      t.integer :products_counter, default: 0
      t.string :ancestry
      t.timestamps
    end
  end
end
