# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "create an admin account and a user account"
User.create!(email: "admin@test.com", password: "123456", password_confirmation: "123456", is_admin: true)
User.create!(email: "123@gmail.com", password: "123456", password_confirmation: "123456", is_admin: false)

puts "chef info"
chefs =[{name:"Bobby Flay", description:"钟爱厨艺，也喜爱品尝不同国家美食，足迹遍布多国，每年均会抽空到外地旅游和享受美酒佳肴，揣摩世界各地的厨艺和探索饮食潮流，随之融会贯通，创造出个人的烹饪风格。",
  level:"一级厨师", style:"法式料理",image_path: "#{Rails.root}/app/assets/images/Bobby-Flay.jpg", is_hidden: true},
  {name:"Matt Lambert", description:"钟爱厨艺，也喜爱品尝不同国家美食，足迹遍布多国，每年均会抽空到外地旅游和享受美酒佳肴，揣摩世界各地的厨艺和探索饮食潮流，随之融会贯通，创造出个人的烹饪风格。",
    level:"一级厨师", style:"法式料理",image_path: "#{Rails.root}/app/assets/images/Bobby-Flay.jpg", is_hidden: true}
]

Product.create!(title: "Nil（原商品已不存在)", description: "Nil", quantity: 0, price: 0, is_hidden: true)
