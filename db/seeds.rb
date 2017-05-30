# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.new
u.email = "example@gmail.com"
u.password = "123456"
u.password_confirmation = "123456"
u.is_admin = true
u.save

# Initialize Product

Product.create!(title: "恋情的终结",
  description: "书",
  price: 39.2,
  quantity: 5,
  image: open("https://images-cn.ssl-images-amazon.com/images/I/51hYTActU4L._SX357_BO1,204,203,200_.jpg")
  )

Product.create!(title: "浮生六记",
  description: "书",
  price: 33.75,
  quantity: 5,
  image: open("https://images-cn.ssl-images-amazon.com/images/I/51v7artv36L._SX384_BO1,204,203,200_.jpg")
  )

Product.create!(title: "步履不停",
  description: "书",
  price: 26.2,
  quantity: 5,
  image: open("https://images-cn.ssl-images-amazon.com/images/I/51MJN%2BwqDTL._SX366_BO1,204,203,200_.jpg")
  )

Product.create!(title: "这么慢，那么美",
  description: "书",
  price: 26.2,
  quantity: 5,
  image: open("https://images-cn.ssl-images-amazon.com/images/I/510im9j53mL._SX357_BO1,204,203,200_.jpg")
  )

Product.create!(title: "我这一辈子",
  description: "书",
  price: 23.3,
  quantity: 5,
  image: open("https://images-cn.ssl-images-amazon.com/images/I/51ni-h62dOL._SX320_BO1,204,203,200_.jpg")
  )

Product.create!(title: "时间简史",
  description: "书",
  price: 31.1,
  quantity: 5,
  image: open("https://images-cn.ssl-images-amazon.com/images/I/51ewBewBwIL._SX390_BO1,204,203,200_.jpg")
  )

Product.create!(title: "皮特猫",
  description: "书",
  price: 62.8,
  quantity: 5,
  image: open("https://images-cn.ssl-images-amazon.com/images/I/51VECKzx4fL._SX395_BO1,204,203,200_.jpg")
  )

Product.create!(title: "摩尔人的最后叹息",
  description: "书",
  price: 39.2,
  quantity: 5,
  image: open("https://images-cn.ssl-images-amazon.com/images/I/51qzGyYrHbL._SX380_BO1,204,203,200_.jpg")
  )
