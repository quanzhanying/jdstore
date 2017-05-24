class AddContentToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :content, :string
  end
end
