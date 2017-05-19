# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Initialize Admin User
if User.find_by(email: "admin@test.com").nil?
  u = User.new
  u.name = "admin"
  u.email = "admin@test.com"            # 可以改成自己的 email
  u.password = "123456"                 # 最少6位密码
  u.password_confirmation = "123456"    # 重复确认密码
  u.is_admin = true
  u.save
  puts "admin 已经建立好了，账号为：#{u.email}，密码为：#{u.password}"
else
  puts "admin 已经建立过了脚本跳过该步骤！"
end

# User.create!(name: 'admin', email: 'admin@test.com', password: '123456', password_confirmation: '123456', is_admin: true)

# Initialize Product

Product.create!(
  name: "Name 01",
  description: "Description 01",
  price: 4,
  quantity: 5,
  image: open("")
)
