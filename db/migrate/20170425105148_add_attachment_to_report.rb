class AddAttachmentToReport < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :attachment, :string
  end
end
