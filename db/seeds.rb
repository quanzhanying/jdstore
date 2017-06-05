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
 u.email = "admin@test.com"          # can change to own email
 u.password = "123456"                  # at least 6 digit
 u.password_confirmation = "123456"     # at least 6 digit
 u.is_admin = true
 u.save
 puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
else
 puts "Admin 已经建立过了，脚本跳过该步骤。"
end


# Intialize category
if Category.count == 0
  puts "Creating category"
  Category.create!(name: "饮食餐具系列")
  Category.create!(name: "烹饪工具系列")
  Category.create!(name: "特品系列")
else
  puts "Category created already"
end



# Intialize Product


# if Product.count == 0
#   puts "Creating product"
#   Product.create!(title: "HYBRID中西融合系列 骨瓷菜盘",
#     description: "深度：2.5CM 盘口直径：26CM 盘底直径：16CM",
#     price: 298,
#     quantity: 5,
#     image: open("https://ws2.sinaimg.cn/large/006tKfTcgy1fg5uee47asj30rs0rsgn4.jpg"),
#     category_id: 1
#     )
#
#   Product.create!(title: "gogo family-漫步云端 鸡年纪念盘",
#     description: "深度：2.5CM 盘口直径：26CM 盘底直径：16CM",
#     price: 299,
#     quantity: 5,
#     image: open("https://ws3.sinaimg.cn/large/006tKfTcgy1fg5udmiot9j30id0id0uz.jpg"),
#     category_id: 1
#     )
#
#   Product.create!(title: "礼盒“福”字款",
#     description: "小蓝边碗",
#     price: 699,
#     quantity: 5,
#     image: open("https://ws2.sinaimg.cn/large/006tKfTcgy1fg5ucpv8itj30ku0kuqat.jpg"),
#     category_id: 1
#     )
#
#   Product.create!(title: "HYBRID中西融合系列 骨瓷菜盘",
#     description: "深度：2.5CM 盘口直径：26CM 盘底直径：16CM",
#     price: 298,
#     quantity: 5,
#     image: open("https://ws1.sinaimg.cn/large/006tKfTcly1fg5ua4hmg6j30640640sl.jpg"),
#     category_id: 1
#     )
#
#   Product.create!(title: "迷你便携式果汁榨汁机",
#     description: "MR9200-A果汁料理机",
#     price: 328,
#     quantity: 5,
#     image: open("https://ws3.sinaimg.cn/large/006tNc79gy1ffvr0obs1nj30m80m83yt.jpg"),
#     category_id: 2
#     )
#   else
#     puts "Product created already"
#   end

