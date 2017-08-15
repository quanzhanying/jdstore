class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  before_validation :generate_friendly_id, :on => :create
  validates_presence_of :name, :friendly_id

  validates_uniqueness_of :friendly_id

  validates_format_of :friendly_id, :with => /\A[a-z0-9\-]+\z/

  def to_param
    self.friendly_id
  end

  protected

  def generate_friendly_id
    self.friendly_id ||= SecureRandom.uuid
  end
end
