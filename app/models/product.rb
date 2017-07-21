class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :category
  has_many :favorites
  has_many :favorited_users, :through => :favorites, :source => :user

  before_validation :gengrate_friendly_id, :on => :create

  def to_param
    self.friendly_id
  end

  protected
    def gengrate_friendly_id
      self.friendly_id ||= SecureRandom.uuid
    end 
end
