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
  u.name = "admin"
  u.email = "admin@test.com"            # 可以改成自己的 email
  u.password = "123456"                 # 最少6位密码
  u.password_confirmation = "123456"    # 重复确认密码
  u.is_admin = true
  u.save
  puts "admin 已经建立好了，账号为：#{u.email}，密码为：#{u.password}"
else
  puts "admin 已经建立过了，脚本跳过该步骤。"
end

# User.create!(name: 'admin', email: 'admin@test.com', password: '123456', password_confirmation: '123456', is_admin: true)

# Initialize Product

Product.create!(
  name: "山东烟露天红灯樱桃",
  description: "Description 01",
  price: 75,
  quantity: 99,
  img_url: "https://ws2.sinaimg.cn/large/006tKfTcgy1ffu5kdid1nj30i20hrgo2.jpg"
  # image: open("https://ws2.sinaimg.cn/large/006tKfTcgy1ffu5kdid1nj30i20hrgo2.jpg")
)

Product.create!(
  name: "陕西金太阳大黄杏",
  description: "Description 02",
  price: 30,
  quantity: 99,
  img_url: "https://ws1.sinaimg.cn/large/006tKfTcgy1ffu5y5eizej30ly0lln1e.jpg"
  # image: open("https://ws1.sinaimg.cn/large/006tKfTcgy1ffu5y5eizej30ly0lln1e.jpg")
)

Product.create!(
  name: "缅甸香芒",
  description: "Description 03",
  price: 38,
  quantity: 99,
  img_url: "https://ws1.sinaimg.cn/large/006tKfTcgy1ffu66id6c2j30ly0m1taw.jpg"
  # image: open("https://ws1.sinaimg.cn/large/006tKfTcgy1ffu66id6c2j30ly0m1taw.jpg")
)

Product.create!(
  name: "山东玉菇香瓜",
  description: "Description 04",
  price: 30,
  quantity: 99,
  img_url: "https://ws3.sinaimg.cn/large/006tKfTcgy1ffu6dpk0g0j30zk0zk7di.jpg"
  # image: open("https://ws3.sinaimg.cn/large/006tKfTcgy1ffu6dpk0g0j30zk0zk7di.jpg")
)

Product.create!(
  name: "山东烟露天红灯樱桃2",
  description: "Description 05",
  price: 75,
  quantity: 99,
  img_url: "https://ws2.sinaimg.cn/large/006tKfTcgy1ffu5kdid1nj30i20hrgo2.jpg"
)

Product.create!(
  name: "陕西金太阳大黄杏2",
  description: "Description 06",
  price: 30,
  quantity: 99,
  img_url: "https://ws1.sinaimg.cn/large/006tKfTcgy1ffu5y5eizej30ly0lln1e.jpg"
)

Product.create!(
  name: "缅甸香芒2",
  description: "Description 07",
  price: 38,
  quantity: 99,
  img_url: "https://ws1.sinaimg.cn/large/006tKfTcgy1ffu66id6c2j30ly0m1taw.jpg"
)

Product.create!(
  name: "山东玉菇香瓜",
  description: "Description 08",
  price: 30,
  quantity: 99,
  img_url: "https://ws3.sinaimg.cn/large/006tKfTcgy1ffu6dpk0g0j30zk0zk7di.jpg"
)

#下面兩個方法2選1

#方法1.先將照片上傳到iPic或其他位置，建議用這個方法
# Photo.create!(product_id:1,avatar: open('http://位置1.jpg'))
# Photo.create!(product_id:1,avatar: open('http://位置2.jpg'))

#方法2.照片在本地，先把照片放在 /app/assets/images/products 裡面一起推到heroku
#但git push heroku完要馬上跑seed.否則圖會被heroku刪除
# Photo.create!(product_id:1,avatar: open(File.join(Rails.root, "/app/assets/images/products/1-1.jpg")))
# Photo.create!(product_id:1,avatar: open(File.join(Rails.root, "/app/assets/images/products/1-2.jpg")))
