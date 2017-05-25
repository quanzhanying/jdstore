class AddImg4UrlToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :img4_url, :string
  end
end
