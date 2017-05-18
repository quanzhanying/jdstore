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

Product.create!(title: "QC-35",
  description: "耳机",
  price: 2800,
  quantity: 5,
  image: open("http://media.nintendo.com/nintendo/bin/pnQltLVy8aGp5q6xq04dWUJbygjIEuZg/VBJPUsIXYslEBuSR8-YCNYmBzvWqKRpN.jpg")
  )

Product.create!(title: "Iphone7",
  description: "手机",
  price: 5000,
  quantity: 5,
  image: open("http://media.nintendo.com/nintendo/bin/asUarutBdpoEfUN9RRw62YyCHLe5bnz7/3Imp6pfRvpmw7aHawbDOew7O3QppdGMB.jpg")
  )

Product.create!(title: "Cherry Keyboard",
  description: "G80-3000键盘",
  price: 2800,
  quantity: 5,
  image: open("http://media.nintendo.com/nintendo/bin/Ty3W0eXgbtDl4YutYUfJD5Yz7w7t3tGE/WbCZQBhTu-vYQxCpay3PB2HGUFVKksaI.jpg")
  )
