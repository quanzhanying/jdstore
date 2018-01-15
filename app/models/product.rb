class Product < ApplicationRecord


  mount_uploader :image, ImageUploader
  belongs_to :category, :optional => true
  has_many :favorites
  has_many :favorited_users, :through => :favorites, :source => :user


  STATUS =["draft", "public", "private"]
  validates_inclusion_of :status, :in => STATUS

  before_validation :gengrate_friendly_id, :on => :create
  validates_presence_of :friendly_id

  validates_uniqueness_of :friendly_id
  validates_format_of :friendly_id, :with => /\A[a-z0-9\-]+\z/

  def to_param
    self.friendly_id
  end

  protected
    def gengrate_friendly_id
      self.friendly_id ||= SecureRandom.uuid
    end


end
