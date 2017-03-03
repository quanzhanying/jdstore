class AddMoreDetailToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :clothes, :string
    add_column :products, :living, :string
    add_column :products, :eating, :string
    add_column :products, :walking, :string
    add_column :products, :playing, :string
    add_column :products, :bathing, :string
    add_column :products, :is_clothes, :boolean, default: false
    add_column :products, :is_living, :boolean, default: false
    add_column :products, :is_eating, :boolean, default: false
    add_column :products, :is_playing, :boolean, default: false
    add_column :products, :is_bathing, :boolean, default: false
    add_column :products, :is_walking, :boolean, default: false
    add_column :products, :is_hidden, :boolean, default: false
  end
end
