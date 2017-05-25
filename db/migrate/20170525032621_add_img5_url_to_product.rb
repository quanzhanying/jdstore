class AddImg5UrlToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :img5_url, :string
  end
end
