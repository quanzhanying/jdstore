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

  def has_follow?(chef)
    favor_chefs.include?(chef)
  end

  def follow!(chef)
    favor_chefs << chef
  end

  def unfollow!(chef)
    favor_chefs.delete(chef)
  end
end
