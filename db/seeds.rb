# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "这是种子档，自动建立一个admin账号，并且创立3个产品"

create_account = User.create([email: 'a@163.com', password: '123456', password_confirmation: '123456', is_admin: 'true'])
puts "Admin account created."

Product.create!(
  title: "aaa",
  description: "ala sljleo dkdk",
  price: 500,
  quantity: 1000,
  picture: open("https://ws3.sinaimg.cn/large/006tKfTcgy1fj264ia7brj316014m13p.jpg")
)

Product.create!(
  title: "bbb",
  description: "ala sljleo dkdk",
  price: 200,
  quantity: 5,
  picture: open("https://ws3.sinaimg.cn/large/006tNc79gy1fik2nghw0tj315u0nen36.jpg")
)

Product.create!(
  title: "ccc",
  description: "ala sljleo dkdk",
  price: 1000,
  quantity: 20,
  picture: open("https://ws2.sinaimg.cn/large/006tNc79ly1fiie7qpjpzj30zk0msh4l.jpg")
)
puts "3 products created."
