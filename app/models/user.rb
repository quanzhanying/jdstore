class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :reviews, dependent: :destroy              #商品留言关系，dependent: :destroy表述联级删除

  # ---与order订单关系---

  has_many :orders


  # ---is_admin判断式---

  def admin?
    is_admin
  end

end
