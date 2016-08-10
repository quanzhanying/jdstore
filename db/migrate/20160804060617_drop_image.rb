class DropImage < ActiveRecord::Migration[5.0]
  def change
    drop_table :images
  end
end
