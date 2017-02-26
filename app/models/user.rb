class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    is_admin
  end

  has_many :orders
  has_many :favor_chefs_relationships
  has_many :favor_chefs, through: :favor_chefs_relationships, source: :chef

  has_many :chef_comments
  has_many :comments_for_chefs, through: :chef_comments, source: :chef

  has_many :favor_product_relationships
  has_many :favor_products, through: :favor_product_relationships, source: :product

  def has_follow?(chef)
    favor_chefs.include?(chef)
  end

  def follow!(chef)
    favor_chefs << chef
  end

  def unfollow!(chef)
    favor_chefs.delete(chef)
  end

  def has_follow_dish?(product)
    favor_products.include?(product)
  end

  def follow_dish!(product)
    favor_products << product
  end

  def unfollow_dish!(product)
    favor_products.delete(product)
  end
end
