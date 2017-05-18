# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Initialize Admin User
if User.find_by(email: "shu_18@163.com").nil?
  u = User.new
  u.email = "shu_18@163.com"           # 可以改成自己的 email
  u.password = "123456"                # 最少要六码
  u.password_confirmation = "123456"   # 最少要六码
  u.is_admin = true
  u.save
  puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
else
  puts "Admin 已经建立过了，脚本跳过该步骤。"
end


# Initialize Product

Product.create!(title: "QC-35",
  description: "耳机",
  price: 2800,
  quantity: 5,
  #image: open("https://images-cn.ssl-images-amazon.com/images/I/41bVSMLUllL._AC_UL320_SR320,320_.jpg")
  #可用于app/uploaders/image_uploader.rb 没有设置有图片格式的whitelist的时候，如有需将　`open` 改成　`MiniMagick::Image.open`
  image: MiniMagick::Image.open("https://images-cn.ssl-images-amazon.com/images/I/41bVSMLUllL._AC_UL320_SR320,320_.jpg")
  )

Product.create!(title: "Nikon 尼康 1 J5+VR 相机",
  description: "Nikon 尼康 1 J5+VR 10-100mm f/4-5.6 可换镜数码套机(黑色)",
  price: 2499,
  quantity: 6,
  image: MiniMagick::Image.open("https://images-cn.ssl-images-amazon.com/images/I/51r2sp28MoL.jpg")
  )

Product.create!(title: "Cherry Keyboard",
  description: "G80-3000键盘",
  price: 2800,
  quantity: 5,
  image: MiniMagick::Image.open("https://images-cn.ssl-images-amazon.com/images/I/41LN-bXtA7L._AC_UL320_SR320,320_.jpg")
  )
