class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders

  def updated_at_formate
    self.updated_at.strftime("%Y-%m-%d %H:%M:%S")
  end

  def last_sign_in_at_formate
    self.last_sign_in_at.strftime("%Y-%m-%d %H:%M:%S")
  end

  def admin?
    is_admin
  end
end
