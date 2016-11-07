class AddPicsToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :attachment, :string
  end
end
