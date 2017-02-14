class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    is_admin
  end
  has_many :orders
  has_attached_file :avatar, :styles => { :medium => "100x100>", :thumb => "30x30#" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  has_many :reviews, dependent: :destroy
  has_many :favorites
  has_many :favorite_products, :through => :favorites, :source => :product
  def is_fan_of?(group)
    favorite_products.include?(group)
  end
  
end
