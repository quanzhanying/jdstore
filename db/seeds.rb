# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Initialize Admin User
if User.find_by(email: "zhuqi@test.com").nil?
  u = User.new
  u.email = "zhuqi@test.com"           # 可以改成自己的 email
  u.password = "123456"                # 最少要六码
  u.password_confirmation = "123456"   # 最少要六码
  u.is_admin = true
  u.save
  puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
else
  puts "Admin 已经建立过了，脚本跳过该步骤。"
end


# Initialize one Product

Product.create!(

 title: " 发条金属步行机器人 ",
  description: "扭动发条，可爱的小机器人就会走动。手臂可以活动，头部有弹簧，也适合当做摆件。材质：锡金属；尺寸：4.5“×2.5”×1.5",
  price: 63,
  quantity: 250,
  category_id: 2,
  image: open("https://images-na.ssl-images-amazon.com/images/I/51nAg2LMT9L.jpg"),
  product_images_attributes: [
    { image: open("https://images-na.ssl-images-amazon.com/images/I/51nAg2LMT9L.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/61xJIPORTDL._SL1001_.jpg")},
    { image: open("https://images-na.ssl-images-amazon.com/images/I/61Bc-twNN8L._SL1001_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/61QlEkgLcNL._SL1001_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/61fAlBCjobL._SL1001_.jpg") }
  ]
  )
puts "成功建立1个商品"

# Initialize one Category
Category.create!(
name: "大孩子"
)
puts "成功建立1个类别"
