class CreateChefLevels < ActiveRecord::Migration[5.0]
  def change
    create_table :chef_levels do |t|
      t.string    :level_title
      t.timestamps
    end
  end
end
