class User < ApplicationRecord

  has_many :orders
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    is_admin
  end

  def user_name
    if self.name.present?
      self.name
    else
      self.email.split("@").first
    end
  end

end
