# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# u = User.new
# u.email = "admin@test.com"           # 可以改成自己的 email
#
# u.password = "123456"                # 最少要六码
#
# u.password_confirmation = "123456"   # 最少要六码
#
# u.is_admin = true
# u.save

products =[{title:"Logitech mouse MT630",
	        description: "The Logitech Ultrathin Touch Mouse T630 is built to complement today's
                        sleek, sophisticated Ultrabook computers. It features a brushed
                        metallic body with a silky-smooth touch surface, and the thin,
                        lightweight design is incredibly portable so you can take it anywhere. ",
	        image_path: "#{Rails.root}/app/assets/images/logitech_mt630.jpg"},

	        {title:"Bose QuietComfort 35",
	        description: "World-class noise cancellation makes quiet sound quieter and music sound better
                        Volume-optimized EQ for balanced audio performance at any volume
                        Wireless convenience, with easy Bluetooth and NFC pairing aided by voice prompts
                        20-hour battery life per charge; up to 40 hours in wired mode
                        Noise-rejecting dual-microphone system for clear calls even in windy environments",
	        image_path: "#{Rails.root}/app/assets/images/QC35.jpg"}
]

u = User.create([ email: 'admin@test.com' ,  password: '123456' ,password_confirmation:'123456',is_admin:true])
puts "created an admin user"

p1 = Product.create([title:products[0][:title],description:products[0][:description],quantity:20,price:500,image:open(products[0][:image_path])])
p2 = Product.create([title:products[1][:title],description:products[1][:description],quantity:30,price:3000,image:open(products[1][:image_path])])
puts "create products"
