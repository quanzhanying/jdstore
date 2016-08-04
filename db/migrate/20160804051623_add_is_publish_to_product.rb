class AddIsPublishToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :is_publish, :boolean, default: false
  end
end
