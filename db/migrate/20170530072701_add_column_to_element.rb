class AddColumnToElement < ActiveRecord::Migration[5.0]
  def change
     add_column :elements, :element_id, :integer
     add_column :elements, :element_name, :string
  end
end
