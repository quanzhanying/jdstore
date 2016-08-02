class RenameProductStatusToIsPublished < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :status, :is_published
  end
end
