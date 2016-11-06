class AddPostToCarts < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :post, :string
  end
end
