class AddImg2UrlToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :img2_url, :string
  end
end
