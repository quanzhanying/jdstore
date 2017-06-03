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
  puts "Admin 已经建立过了，脚本跳过该步骤."
end


# Initialize one Product

if Product.find_by(title: "发条金属步行机器人").nil?
Product.create!(

 title: "发条金属步行机器人",
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
  puts "成功建立1个商品：发条金属步行机器人"
else
  puts "发条金属步行机器人 已经存在"
end

if Product.find_by(title: "磁应力金属橡皮泥").nil?
Product.create!(


 title: "磁应力金属橡皮泥",
  description: "让橡皮泥“活”起来！不仅能像普通橡皮泥一样可随意捏出各种造型，更能被磁铁所吸引！！试着把它塑造成眼镜蛇的造型，用磁铁就能让它摇头晃脑。白领及高压人士选择，缓解压力宣泄情绪之良品。",
  price: 185,
  quantity: 30,
  category_id: 2,
  image: open("https://images-na.ssl-images-amazon.com/images/I/51AMaD8ErgL._SL1000_.jpg"),
  product_images_attributes: [
    { image: open("https://images-na.ssl-images-amazon.com/images/I/51AMaD8ErgL._SL1000_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/51nYUv2TTtL.jpg")},
    { image: open("https://images-na.ssl-images-amazon.com/images/I/519pUKZQCBL.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/51weVsatkyL.jpg") }
  ]
  )
  puts "成功建立1个商品：磁应力金属橡皮泥"
else
  puts "磁应力金属橡皮泥 已经存在"
end


# Initialize one Category
# if Category.find_by(name: "大孩子").nil?
# Category.create!(
# name: "大孩子"
# )
# puts "成功建立1个类别：大孩子"
# else
#   puts "类别：大孩子 已经存在"
# end
