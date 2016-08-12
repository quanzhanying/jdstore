class AddAttachmentToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :attachment, :string
  end
end
