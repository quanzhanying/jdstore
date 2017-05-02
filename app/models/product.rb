class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  before_create :generate_friendly_id

  def to_param
    self.friendly_id
  end

  protected
  def generate_friendly_id
    self.friendly_id ||= SecureRandom.uuid
  end
end
