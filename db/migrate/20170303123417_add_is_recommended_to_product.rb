class AddIsRecommendedToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :is_recommended, :boolean, default: false
  end
end
