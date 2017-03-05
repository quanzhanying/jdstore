class CreateChefShadows < ActiveRecord::Migration[5.0]
  def change
    create_table :chef_shadows do |t|
      t.integer :order_id
      t.string :name
      t.string :level
      t.string :style
      t.timestamps
    end
  end
end
