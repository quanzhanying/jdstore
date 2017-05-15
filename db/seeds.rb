# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.new

u.email = "bigmouthcrow@gmail.com"           # 可以改成自己的 email

u.password = "123456"                # 最少要六码

u.password_confirmation = "123456"   # 最少要六码

u.is_admin = false

u.save

# Initialize Admin User
if User.find_by(email: "superzrr@gmail.com").nil?
  u = User.new
  u.email = "superzrr@gmail.com"
  u.password = "1qazxsw2"
  u.password_confirmation = "1qazxsw2"
  u.is_admin = true
  u.save
  puts "Admin has been set up , accout is #{u.email}, pwd is #{u.password}"
else
  puts "Admin has been set up before, skip the step"
end

# Initialize products
Product.create!(
  title: "girl clothes",
  description:"beauterful dress",
  price:39,
  quantity:10,
  image: open("http://yanxuan.nosdn.127.net/24db6b40ecc02d111f136918a3ee0e29.jpg?imageView&quality=90&thumbnail=430x430")
)


Product.create!(
  title: "boy T",
  description:"good quanity, for handsome boys",
  price:39,
  quantity:15,
  image:open("http://yanxuan.nosdn.127.net/69e2463f7fb6b606f29af9f2b85c9562.jpg?imageView&thumbnail=430x430&quality=95")
)



Product.create!(
  title: "grils dress",
  description:"good quanity, for beauterful princess",
  price:99,
  quantity:15,
  image:open("http://yanxuan.nosdn.127.net/cdd7640a18e30a9477e361070aa1f8d5.jpg?imageView&thumbnail=430x430&quality=95")
)
