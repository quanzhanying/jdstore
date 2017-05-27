class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :reviews, dependent: :destroy              #商品留言关系，dependent: :destroy表述联级删除


  # ---收藏商品功能三方关系代码块---

  has_many :collections                               #收藏商品关系
  has_many :participated_products, through: :collections, source: :product

  def is_member_of?(product)
    participated_products.include?(product)
  end

  def join_collection!(product)
    participated_products << product
  end

  def quit_collection!(product)
    participated_products.delete(product)
  end


  # ---与order订单关系---

  has_many :orders
  has_many :course_orders


  # ---is_admin判断式---

  def admin?
    is_admin
  end

end
