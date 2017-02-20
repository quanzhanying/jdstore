class DropTableFavor < ActiveRecord::Migration[5.0]
  def change
    drop_table :favor_chef_relationships
  end
end
