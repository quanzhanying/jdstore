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
  u.email = "admin@test.com"           # 可以改成自己的 email
  u.password = "123456"                # 最少要六码
  u.password_confirmation = "123456"   # 最少要六码
  u.is_admin = true
  u.save
  puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
else
  puts "Admin 已经建立过了，脚本跳过该步骤。"
end


# Initialize Product

Product.create!(title: "宝宝第一套好性格养成书:皮特猫(套装共6册) (简体中文) 平装",
  description: "《宝宝性格培养书：皮特猫》内容简介：《宝宝性格培养书：皮特猫》是一套在美国家喻户晓、几乎每个孩子必读的经典绘本，也是美国最畅销的情绪绘本，销量已超过950万册，至今仍稳居美国亚马逊畅销榜前茅，几乎每个家庭的孩子都拥有一册《皮特猫》。",
  price: 63,
  quantity: 250,
  image: open("https://images-cn.ssl-images-amazon.com/images/I/51VECKzx4fL._SX395_BO1,204,203,200_.jpg")
  )

  Product.create!(title: "Where Is Baby's Belly Button? 纸板书 ",
    description: " Where are Baby's hands?
Under the bubbles!

Where are baby's eyes?
Under her hat!

Karen Katz's adorable babies play peekaboo in this delightful interactive book. The sturdy format and easy-to-lift flaps are perfect for parents and children to share.",
    price: 40,
    quantity: 250,
    image: open("https://images-cn.ssl-images-amazon.com/images/I/51scITk38DL._SX448_BO1,204,203,200_.jpg")
    )
