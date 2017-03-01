# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


u = User.new
u.email = "admin@gmail.com"           # 可以改成自己的 email

u.password = "123456"                # 最少要六码

u.password_confirmation = "123456"   # 最少要六码

u.is_admin = true
u.save


products =[{title:"上海国际马拉松赛报名",
	        description: "上海国际马拉松，等你一起，申爱到底。",
	        image_path: "#{Rails.root}/app/assets/images/上马.jpg"},

	        {title:"应急医疗技术EMT培训班",
	        description: "EMT(Emergency Medical Technician)应急医疗技术人员的培训，自1960年代在美国开始发展，目前已是北美应急医疗服务体系(Emergency Medical Service System)中，替代传统医护人员的主要应急工作力量，其核心的技能在于院外的应急医疗救护，依据培训的等级以及各国家或地区的法律授权规范，执行从基础生命维持(Basic Life Support)到高等的生命维持(Advance Life Support)。",
	        image_path: "#{Rails.root}/app/assets/images/emt.jpg"}
]
puts "3 products created."

u = User.create([ email: 'admin@gmail.com' ,  password: '123456' ,password_confirmation:'123456',is_admin:true])
puts "create a adminer"

p1 = Product.create([title:products[0][:title],description:products[0][:description],quantity:20,price:30,image:open(products[0][:image_path])])
p2 = Product.create([title:products[1][:title],description:products[1][:description],quantity:20,price:30,image:open(products[1][:image_path])])
puts "create products"
