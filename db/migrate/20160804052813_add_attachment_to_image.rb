class AddAttachmentToImage < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :attachment, :string
  end
end
