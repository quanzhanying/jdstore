# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
products =[{title:"Apple iPhone 6 64GB",
	        description: "This Certified Refurbished product has been tested and certified 
	              to work and look like new, with minimal to no signs of wear, by a specialized
	              third-party seller approved by Amazon. The product is backed by a minimum 90-day warranty, 
	              and may arrive in a generic brown or white box. Accessories may be generic and not directly 
	              from the manufacturer.",
	        image_path: "#{Rails.root}/app/assets/images/iphone.jpg"},

	        {title:"A Mid-Back Mesh Chair",
	        description: "Ergonomic office chair with contoured mesh back for breathability
	              Pneumatic seat-height adjustment; padded seat for comfort.",
	        image_path: "#{Rails.root}/app/assets/images/chair.jpg"}
]

u = User.create([ email: 'a@a.com' ,  password: '123456' ,password_confirmation:'123456',is_admin:true])
puts "create a adminer"

p1 = Product.create([title:products[0][:title],description:products[0][:description],quantity:20,price:30,image:open(products[0][:image_path])])
p1 = Product.create([title:products[1][:title],description:products[1][:description],quantity:20,price:30,image:open(products[1][:image_path])])
puts "create products"