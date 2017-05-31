class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :username, presence: true, length: {maximum: 25}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
  has_many :orders
  has_many :identifies
  def admin?
    is_admin
  end

  has_many :favorites
  has_many :products, through: :favorites, source: :product

  def is_favorites?(product)
    products.include?(product)
  end

  def favorites!(product)
    products << product
  end

  def nonfavorites!(product)
    products.delete(product)
  end

  def self.from_google(access_token, signed_in_resource=nil)
  	data = access_token.info
  	identify = Identify.find_by(:provider => access_token.provider, :uid => access_token.uid)

  	if identify
  		return identify.user
  	else
  		user = User.find_by(:email => access_token.email)
  		if !user
  			user = User.create(
  				username: data["name"],
  				email: data["email"],
  				image: data["image"],
  				password: Devise.friendly_token[0,20]
  			)
  		end
			identify = Identify.create(
				provider: access_token.provider,
				uid: access_token.uid,
				user: user
			)
		return user
  	end
  end
end
