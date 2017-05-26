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

Product.create!(title: "印第安风格耳坠",
  description: "耳坠",
  price: 340,
  quantity: 5,
  image: open("http://ww4.sinaimg.cn/large/006tKfTcgy1ffw2p230haj30u00u077i.jpg"),
  :category => "accessory"
  )

Product.create!(title: "Twice同款耳环",
  description: "耳环",
  price: 460,
  quantity: 5,
  image: open("http://ww1.sinaimg.cn/large/006tKfTcgy1ffw2mfzxinj30u00u0gne.jpg"),
  :category => "accessory"
  )

Product.create!(title: "Girl's Day同款戒指",
  description: "戒指",
  price: 280,
  quantity: 5,
  image: open("http://ww1.sinaimg.cn/large/006tKfTcgy1ffw2mjknvlj30u00u0wfi.jpg"),
  :category => "accessory"
  )

Product.create!(title: "肉粉色板鞋",
    description: "板鞋",
    price: 680,
    quantity: 5,
    image: open("http://ww1.sinaimg.cn/large/006tNc79gy1ffwp0o1o5fj30rs112t9x.jpg"),
    :category => "shoes"
    )

Product.create!(title: "白色板鞋",
    description: "板鞋",
    price: 680,
    quantity: 5,
    image: open("http://ww1.sinaimg.cn/large/006tNc79gy1ffwp4c5lh2j30rs112dgt.jpg"),
    :category => "shoes"
    )

Product.create!(title: "黑色板鞋",
    description: "板鞋",
    price: 680,
    quantity: 5,
    image: open("http://ww3.sinaimg.cn/large/006tNc79gy1ffwp0denaij30rs112abd.jpg"),
    :category => "shoes"
    )
