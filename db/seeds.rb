# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Initialize Admin User
if User.find_by(email: "wuxiao@123.com").nil?
u = User.new
u.email = "wuxiao@123.com"
u.password = "111111"
u.password_confirmation = "111111"
u.is_admin = true
u.save
puts "Admin 已经建立好了，账号为#{u.email}, 密码为#{u.password}"
else
  puts "Admin 已经建立过了，脚本跳过该步骤。"
end

# Initialize product

Product.create!(title: "冬茸",
  description: "产自冬茸的故乡澜沧拉祜族自治县竹塘乡葛乃村",
  price: 10,
  quantity: 5,
  image: open("https://ooo.0o0.ooo/2017/05/17/591c101a38cd2.png")
  )

Product.create!(title: "野生结晶蜂蜜",
  description: "产自澜沧拉祜族自治县多依林村",
  price: 10,
  quantity: 5,
  image: open("https://ooo.0o0.ooo/2017/05/17/591c117775ebd.png")
  )

Product.create!(title: "野生滇橄榄",
  description: "产自澜沧拉祜族自治县富邦乡佧朗村",
  price: 10,
  quantity: 5,
  image: open("https://ooo.0o0.ooo/2017/05/17/591c11ffc6eed.png")
  )

Product.create!(title: "茨竹笋",
  description: "产自澜沧拉祜族自治县发展河乡勐乃村",
  price: 10,
  quantity: 5,
  image: open("https://ooo.0o0.ooo/2017/05/17/591c1287f4026.png")
  )
