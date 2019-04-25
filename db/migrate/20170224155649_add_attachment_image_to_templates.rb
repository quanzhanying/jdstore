class AddAttachmentImageToTemplates < ActiveRecord::Migration
  def self.up
    change_table :templates do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :templates, :image
  end
end
