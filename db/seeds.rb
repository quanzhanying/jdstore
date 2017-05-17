# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.find_by(email: "449245472@qq.com").nil?
    u = User.new
    u.email = "449245472@qq.com"           # 可以改成自己的 email
    u.password = "898989"                # 最少要六码
    u.password_confirmation = "898989"   # 最少要六码
    u.is_admin = true
    u.save
    puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
  else
    puts "Admin 已经建立过了，脚本跳过该步骤。"
  end

Product.create!(
  title:"rose",
  description:"flower",
  quantity:100,
  price:199,
  image: open("http://www.roseonly.com.cn/upload/products/14903526011773461.png")
)
f_title = ["bouquet1","bouquet2","bouquet3","bouquet4","bouquet5","bouquet6"]
f_images = ["http://satohana.com/images/2017/03/DSC_05161.jpg",
"http://satohana.com/images/2017/03/DSC_0196-001.jpg",
"http://satohana.com/images/2017/03/DSC_02951.jpg",
"http://satohana.com/images/2017/03/DSC_05861.jpg",
"http://satohana.com/images/2016/12/DSC_0177-462x5251.jpg",
"http://satohana.com/images/2014/07/DSC_62911.jpg"
]
for i in 0..5 do
  Product.create!(
  title: f_title[i],
  description:"flower",
  quantity:100,
  price:rand(10..50),
  image: open(f_images[i]))
end
