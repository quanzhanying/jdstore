class User < ApplicationRecord
   has_many :orders
   
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :products
has_many :favorites
has_many :favorite_products, :through => :favorites, :source => :product
has_many :reviews
has_many :votes
has_many :voted_products, :through => :votes, :source => :product
 def admin?
   is_admin
 end
 def is_favorite_of?(product)
favorite_products.include?(product)
 end

 def is_voter_of?(product)
    voted_products.include?(product)
  end
  def upvote!(product)
    voted_products << product
  end

  def downvote!(product)
    voted_products.delete(product)
  end
end
