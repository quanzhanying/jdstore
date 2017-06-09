# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Initialize Admin User

# Initialize product



    if User.find_by(email: "admin@test.com").nil?
    u = User.new
    u.email = "admin@test.com"           # 可以改成自己的 email
    u.password = "123456"                # 最少要六码
    u.password_confirmation = "123456"   # 最少要六码
    u.is_admin = true
    u.save
    puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
    else
    puts "Admin 已经建立过了，脚本跳过该步骤。"
    end

     Category.create(name: "最新上架")
     Category.create(name: "经管商业")
     Category.create(name: "人文艺术")
     Category.create(name: "历史传记")
     Category.create(name: "亲子教育")

  Product.create!(title: "穷查理宝典",
  author: "查理芒哥",
  description:10,
  quantity: 5,
  price: 2,
  image: open("https://img1.doubanio.com/lpic/s4532008.jpg")
  )

  Product.create!(title: "穷查理宝典",
  author: "查理芒哥",
  description:10,
  quantity: 5,
  price: 2,
  image: open("https://ws2.sinaimg.cn/large/006tKfTcgy1fgfb1n0yj7j30hh0i2q62.jpg")
  )
