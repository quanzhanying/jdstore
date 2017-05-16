# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


u = User.new
u.email = "admin@gmail.com"           # 可以改成自己的 email

u.password = "111111"                # 最少要六码

u.password_confirmation = "111111"   # 最少要六码

u.is_admin = true
u.save




Product.create!(title: "斗笠杯",
  description: "龙泉青瓷斗笠杯",
  price: 280,
  quantity: 50,
  pic: open("http://ww2.sinaimg.cn/large/006tKfTcgy1ffn9ln4bxnj30m80m8aly.jpg")
  )

Product.create!(title: "侧把茶具套装",
  description: "龙泉青瓷之侧把茶具套装",
  price: 888,
  quantity: 50,
  pic: open("http://ww4.sinaimg.cn/large/006tNc79gy1ffnhfvvjfej30m80m9aig.jpg")
  )
