class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    has_many :orders
    has_many :product_lists

    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    def admin?
        is_admin
    end

    scope :all_except, ->user{where.not(id:user)}
end
