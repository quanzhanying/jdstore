class AddDescriptionReToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :description_re, :text
  end
end
