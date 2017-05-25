class AddImg1UrlToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :img1_url, :string
  end
end
