# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.new
u.email = "qsl0705@163.com"

u.password = "qsl518518"

u.password_confirmation = "qsl518518"

u.is_admin = true
u.save

Product.create!(title: "花椰菜",
	description: "蔬菜",
	price: "10",
	quantity: "300",
	image: open("http://ww1.sinaimg.cn/large/006tNc79ly1ffyy02zlzxj31kw1aa1kx.jpg")
	)

Product.create!(title: "西红柿",
	description: "蔬菜",
	price: "6",
	quantity: "200",
	image: open("http://ww1.sinaimg.cn/large/006tNc79ly1ffyxuo97fvj30xc0m876n.jpg")
	)

Product.create!(title: "南瓜",
	description: "蔬菜",
	price: "15",
	quantity: "500",
	image: open("http://ww4.sinaimg.cn/large/006tNc79ly1ffyxu3m71bj30sg0iqwfj.jpg")
	)

Product.create!(title: "鱼",
	description: "海鲜",
	price: "50",
	quantity: "1000",
	image: open("http://ww1.sinaimg.cn/large/006tNc79ly1ffyxukej9tj30sg0dogmt.jpg")
	)

Product.create!(title: "蛤蜊",
	description: "海鲜",
	price: "40",
	quantity: "3000",
	image: open("http://ww4.sinaimg.cn/large/006tNc79ly1ffyxum5ku3j30dw09t74m.jpg")
	)
