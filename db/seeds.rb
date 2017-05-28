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
  u.username = "test"
  u.email = "wx@test.com"           # 可以改成自己的 email
  u.password = "123456"                # 最少要六码
  u.password_confirmation = "123456"   # 最少要六码
  u.is_admin = true
  u.save
  puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
else
  puts "Admin 已经建立过了，脚本跳过该步骤。"
end

#category
c = Category.new
c.name = "鲜花"
c.description = "鲜花"
c.save


# Initialize Product


Product.create!(title: "爱在墨西哥",
  description: "花束",
  price: 210,
  quantity: 10,
  category_id: 1,
  image: open("https://ws3.sinaimg.cn/large/006tKfTcgy1ffzpjbccmvj30kx0t0n1c.jpg")
  )

Product.create!(title: "繁星",
  description: "花束",
  price: 180,
  quantity: 5,
  category_id: 1,
  image: open("https://ws3.sinaimg.cn/large/006tKfTcgy1ffzpo4l3srj30lh0sg0wn.jpg")
  )

Product.create!(title: "夏日倾情",
  description: "花束",
  price: 180,
  quantity: 5,
  category_id: 1,
  image: open("https://ws2.sinaimg.cn/large/006tKfTcgy1ffzpu05r6ij30l00swjvd.jpg")
  )
