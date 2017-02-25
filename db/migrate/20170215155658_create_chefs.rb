class CreateChefs < ActiveRecord::Migration[5.0]
  def change
    create_table :chefs do |t|
      t.string :name
      t.text :description
      t.string :level
      t.string :style
      t.boolean :is_hidden, default: true
      t.string :image
      t.timestamps
    end
  end
end
