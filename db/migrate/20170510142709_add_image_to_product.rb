class AddImageToProduct < ActiveRecord::Migration[5.0]
  def change
    mount_uploader :image, ImageUploader
  end
end
