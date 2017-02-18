class CreateChefTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :chef_times do |t|
      t.integer :chef_id
      t.string :day
      t.string :time
      t.boolean :is_available, default: true
      t.timestamps
    end
  end
end
