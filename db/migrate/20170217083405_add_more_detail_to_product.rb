class AddMoreDetailToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :clothes, :string
    add_column :products, :living, :string
    add_column :products, :eating, :string
    add_column :products, :walking, :string
    add_column :products, :playing, :string
    add_column :products, :bathing, :string
    add_column :products, :is_clothes, :boolean, default: true
    add_column :products, :is_living, :boolean, default: true
    add_column :products, :is_eating, :boolean, default: true
    add_column :products, :is_playing, :boolean, default: true
    add_column :products, :is_bathing, :boolean, default: true
    add_column :products, :is_walking, :boolean, default: true
    add_column :products, :is_hidden, :boolean, default: true
  end
end
