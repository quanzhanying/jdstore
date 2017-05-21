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
  u.email = "admin@gmail.com"
  u.password = "123456"
  u.password_confirmation = "123456"
  u.is_admin = true
  u.save
  puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
else
  puts "Admin 已经建立过了，脚本跳过该步骤。"
end

# Intialize Product

 Product.create!(title: "Mojito 蛋糕",
    description: "蛋糕",
    price: 298,
    quantity: 5,
    image: open("http://www.mcake.com/postsystem/docroot/images/goods/20150818/2024/middle_2024_1.jpg")
    )

  Product.create!(title: "蓝莓拿破仑",
    description: "蛋糕",
    price: 299,
    quantity: 5,
    image: open("http://mcake.oss-cn-hangzhou.aliyuncs.com/goods/lanmeiqingrunapolun/N0301/middle/1.jpg")
    )

  Product.create!(title: "草莓鲜奶蛋糕",
    description: "蛋糕",
    price: 297,
    quantity: 5,
    image: open("http://www.mcake.com/postsystem/docroot/images/goods/20141208/1471/middle_1471_1.jpg")
    )
