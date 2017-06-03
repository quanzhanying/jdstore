class Favorite < ApplicationRecord
  validates :product_id , presence:true
  belongs_to :user

  def self.isExist?(product_id)
    if Favorite.where(:product_id => product_id).all.size > 0
      return true
    else
      return false
    end
  end

  def product
    @product ||= Product.find(self.product_id)
  end
end
