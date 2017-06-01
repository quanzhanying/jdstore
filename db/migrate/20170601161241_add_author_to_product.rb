class AddAuthorToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :author, :string
  end
end
