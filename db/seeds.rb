# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.new

u.email = "admin@test.com"
u.password = "123456"
u.password_confirmation = "123456"
u.is_admin = true
u.save

products =[{title:"芒果芝士",
	        description: "T芒果香味浓烈，令人充满甜蜜希望，故早期人们称之为“蜜望”。无论含义还是色彩都适合和爱你的人一起分享。",
	        image_path: "#{Rails.root}/app/assets/images/iphone.jpg"},

	        {title:"芒果慕斯",
	        description: "芒果慕斯与偶像明星郑凯同台共演，诠释青春的骚动与肆意。那一抹明黄身影，是故事里最贴切的甜意。
          谁是炎炎盛夏里最受爱戴的水果明星，当非芒果莫属！妍媚透亮奔放的.",
	        image_path: "#{Rails.root}/app/assets/images/chair.jpg"}
]

u = User.create([ email: 'a@a.com' ,  password: '123456' ,password_confirmation:'123456',is_admin:true])
puts "create a adminer"

p1 = Product.create([title:products[0][:title],description:products[0][:description],quantity:20,price:30,image:open(products[0][:image_path])])
p2 = Product.create([title:products[1][:title],description:products[1][:description],quantity:20,price:30,image:open(products[1][:image_path])])
puts "create products"
