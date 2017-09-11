class AddParticularsToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :particulars, :text
  end
end
