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
# //http://forum.qzy.camp/t/seeds-rb-jdstore/600?nsukey=%2BtBB%2FMvmubWGG9aRN06vinLkzT2%2BxL7GDNOVthDAGzs1IebDVjmfRJLc3rlpEC0CymSHHe2bO8RmqC%2B9Bd2P45bdX7jUpMKk6yu5SuPSTW4Bxw633fVXqaMBBPCwPwsA6nYkMEIQ3OOje%2FYxy3n5XaY63XANv71kyk2tmhI7EJaklPGrZ4GpHBIGzCWC0OyH
products =[{title:"Apple iPhone 6 64GB",
	        description: "This Certified Refurbished product has been tested and certified
	              to work and look like new, with minimal to no signs of wear, by a specialized
	              third-party seller approved by Amazon. The product is backed by a minimum 90-day warranty,
	              and may arrive in a generic brown or white box. Accessories may be generic and not directly
	              from the manufacturer.",
	        image_path: "#{Rails.root}/public/uploads/product/image/1/1.jpg"},

	        {title:"A Mid-Back Mesh Chair",
	        description: "Ergonomic office chair with contoured mesh back for breathability
	              Pneumatic seat-height adjustment; padded seat for comfort.",
	        image_path: "#{Rails.root}/public/uploads/product/image/1/2.jpg"}
]

u = User.create([ email: 'admin@test.com' ,  password: '123456' ,password_confirmation:'123456',is_admin:true])
puts "create a adminer"

p1 = Product.create([title:products[0][:title],description:products[0][:description],quantity:20,price:30,image:open(products[0][:image_path])])
p2 = Product.create([title:products[1][:title],description:products[1][:description],quantity:20,price:30,image:open(products[1][:image_path])])
puts "create products"
