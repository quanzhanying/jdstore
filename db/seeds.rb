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

					{title:"Apple Watch",
	        description: "Gold aluminum case
												S2 dual-core processor
												Built-in GPS and GLONASS
												Water resistant 50 meters2
												Ion-X glass
												2x brighter OLED Retina display with Force Touch (1000 nits)
												Ceramic back
												Digital Crown
												Heart rate sensor, accelerometer, and gyroscope",
	        image_path: "#{Rails.root}/app/assets/images/watch.jpg"}

					{title:"GoPro Hero5",
	        description: "Stunning 4K video and 12MP photos in Single, Burst and Time Lapse modes.
												Durable by design, HERO5 Black is waterproof to 33ft (10m) without a housing
												Additional GoPro HERO5 Black Features + Benefits below on item page.
												Preview and playback your shots, change settings and trim your footage, all on your GoPro.",
	        image_path: "#{Rails.root}/app/assets/images/gopro_hero5.jpg"}

					{title:"Vuzix M100 Smart Glasses",
	        description: "Vuzix M100 provides the features and capabilities of a modern smartphone, without a cellular radio, in a hands-free wearable device.
												Bluetooth 4.0 connectivity makes it easy to pair with another Android device or connect wirelessly with Wi-Fi to the Internet.
												The M100's integrated camera captures 5 megapixel still images and 1080p high-definition video. Video and image capture can be stored directly on the M100's memory (expandable up to 32 GB) or streamed live.",
	        image_path: "#{Rails.root}/app/assets/images/vuzix_m100.jpg"}


]




u = User.create([ email: 'admin@test.com' ,  password: '123456' ,password_confirmation:'123456',is_admin:true])
puts "created an admin user"

p1 = Product.create([title:products[0][:title],description:products[0][:description],quantity:20,price:500,image:open(products[0][:image_path])])
p2 = Product.create([title:products[1][:title],description:products[1][:description],quantity:30,price:3000,image:open(products[1][:image_path])])
p3 = Product.create([title:products[2][:title],description:products[2][:description],quantity:10,price:2700,image:open(products[2][:image_path])])
p4 = Product.create([title:products[3][:title],description:products[3][:description],quantity:20,price:2500,image:open(products[3][:image_path])])
p5 = Product.create([title:products[4][:title],description:products[4][:description],quantity:20,price:5500,image:open(products[4][:image_path])])
puts "create products"
