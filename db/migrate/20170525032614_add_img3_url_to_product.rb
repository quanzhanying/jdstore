class AddImg3UrlToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :img3_url, :string
  end
end
