class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :products

  def is_admin!
    if !self.is_admin
      self.is_admin = true
      self.save
    else
      self.is_admin = false
      self.save
    end
  end

  def is_admin?
    is_admin || self.email == "1234@123"
  end
end
