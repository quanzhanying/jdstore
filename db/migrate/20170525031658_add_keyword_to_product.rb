class AddKeywordToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :keyword, :string
  end
end
