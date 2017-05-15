# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

u = User.new
u.email = "admin@gmail.com"           # 可以改成自己的 email
u.password = "123456"                # 最少要六码
u.password_confirmation = "123456"   # 最少要六码
u.is_admin = true
u.save

v = User.new
v.email = "user@gmail.com"           # 可以改成自己的 email
v.password = "123456"                # 最少要六码
v.password_confirmation = "123456"   # 最少要六码
v.is_admin = false
v.save

#
# Product.create!(title: "MacBook Pro",
#   description: "电脑",
#   price: 14888,
#   quantity: 30,
#   image: open("http://img14.360buyimg.com/n1/s546x546_jfs/t2518/52/10378951/105842/413f9b3d/5631d2b6N8fa76f15.jpg")
#   )
#
# Product.create!(title: "坚果Pro",
#   description: "手机",
#   price: 1799,
#   quantity: 5,
#   image: open("https://img14.360buyimg.com/n1/s546x546_jfs/t5335/39/1553366100/209772/32105f74/5911bac3N5d51d2aa.jpg")
#   )
#
# Product.create!(title: "大疆（DJI） 精灵3 标准版",
#   description: "无人机",
#   price: 2969,
#   quantity: 15,
#   image: open("http://img14.360buyimg.com/n1/s546x546_jfs/t3232/65/6215650755/81612/3a052265/58a27e59N05fb5fc2.jpg")
#   )
#



Product.create!(title: "MacBook Pro",
  description: "电脑",
  price: 14888,
  quantity: 30,
  image: open("http://img14.360buyimg.com/n1/s546x546_jfs/t2518/52/10378951/105842/413f9b3d/5631d2b6N8fa76f15.jpg")
)

Product.create!(title: "坚果Pro",
  description: "手机",
  price: 1799,
  quantity: 50,
  image: open("https://img14.360buyimg.com/n1/s546x546_jfs/t5335/39/1553366100/209772/32105f74/5911bac3N5d51d2aa.jpg")
)

Product.create!(title: "大疆（DJI） 精灵3 标准版",
  description: "无人机",
  price: 2969,
  quantity: 10,
  image: open("http://img14.360buyimg.com/n1/s546x546_jfs/t3232/65/6215650755/81612/3a052265/58a27e59N05fb5fc2.jpg")
)
