# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#user.is_admin ---(设定管理员账号)
if User.find_by(email: "admin@test.com").nil?
u = User.new
u.email = "admin@test.com"
u.password = "666666"
u.password_confirmation =  "666666"

u.is_admin = true
u.save
puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
else
puts "Admin 已经建立过了，脚本跳过该步骤。"
end

# Initialize product ---(初始产品)

  
  Product.create!(title: "坚果Pro",
    description: "锤子手机 细红线",
    price: 2288,
    quantity: 5,
    image: open("http://img13.360buyimg.com/n1/s450x450_jfs/t5527/223/1660932474/149818/343ed1d7/59130e4cNa6d07fe0.jpg")
    )
  #
  # Product.create!(title: "坚果Pro",
  #   description: "锤子手机 酒红",
  #   price: 2288,
  #   quantity: 5,
  #   image: open("http://item.jd.com/4175269.html")
  #   )
