# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.find_by(email: "123@!23.com").nil?
   u = User.new
   u.email = "123@123.com"           # 可以改成自己的 email
   u.password = "111111"                # 最少要六码
   u.password_confirmation = "111111"   # 最少要六码
   u.is_admin = true
   u.save
   puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
 else
   puts "Admin 已经建立过了，脚本跳过该步骤。"
 end

 # Initialize Product

 Product.create!(title: "疯狂厨师",
   description: "桌面游戏",
   price: 89,
   quantity: 5,
   image: open("https://images-cn.ssl-images-amazon.com/images/I/51u-LDn5yGL._AC_UL320_SR320,320_.jpg")
   )

 Product.create!(title: "采购清单",
   description: "桌面游戏",
   price: 95,
   quantity: 5,
   image: open("https://images-cn.ssl-images-amazon.com/images/I/51UYs1GXbeL._AC_UL320_SR320,320_.jpg")
   )

 Product.create!(title: "披萨披萨",
   description: "桌面游戏",
   price: 89,
   quantity: 5,
   image: open("https://images-cn.ssl-images-amazon.com/images/I/613CZakft3L._AC_UL320_SR320,320_.jpg")
   )
