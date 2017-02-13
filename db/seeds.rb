# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.new
u.email = "admin@test.com"           # 可以改成自己的 email

u.password = "123456"                # 最少要六码

u.password_confirmation = "123456"   # 最少要六码

u.is_admin = true
u.save

products = [{title:"华为",
	        description: "This Certified Refurbished product has been tested and certified
	              to work and look like new, with minimal to no signs of wear, by a specialized
	              third-party seller approved by Amazon. The product is backed by a minimum 90-day warranty,
	              and may arrive in a generic brown or white box. Accessories may be generic and not directly
	              from the manufacturer.",
	        image_path: "#{Rails.root}/app/assets/images/华为.jpg"},

	        {title:"魅族",
	        description: "This Certified Refurbished product has been tested and certified
	              to work and look like new, with minimal to no signs of wear, by a specialized
	              third-party seller approved by Amazon. The product is backed by a minimum 90-day warranty,
	              and may arrive in a generic brown or white box. Accessories may be generic and not directly
	              from the manufacturer.",
	        image_path: "#{Rails.root}/app/assets/images/魅族.jpg"},

          {title:"荣耀8",
	        description: "This Certified Refurbished product has been tested and certified
	              to work and look like new, with minimal to no signs of wear, by a specialized
	              third-party seller approved by Amazon. The product is backed by a minimum 90-day warranty,
	              and may arrive in a generic brown or white box. Accessories may be generic and not directly
	              from the manufacturer.",
	        image_path: "#{Rails.root}/app/assets/images/荣耀8.jpg"},

          {title:"小米5",
	        description: "This Certified Refurbished product has been tested and certified
	              to work and look like new, with minimal to no signs of wear, by a specialized
	              third-party seller approved by Amazon. The product is backed by a minimum 90-day warranty,
	              and may arrive in a generic brown or white box. Accessories may be generic and not directly
	              from the manufacturer.",
	        image_path: "#{Rails.root}/app/assets/images/小米5.jpg"}]

p1 = Product.create([title:products[0][:title],description:products[0][:description],quantity:20,price:3000,image:open(products[0][:image_path])])
p2 = Product.create([title:products[1][:title],description:products[1][:description],quantity:20,price:3000,image:open(products[1][:image_path])])
p3 = Product.create([title:products[2][:title],description:products[2][:description],quantity:20,price:3000,image:open(products[2][:image_path])])
p4 = Product.create([title:products[3][:title],description:products[3][:description],quantity:20,price:3000,image:open(products[3][:image_path])])

puts "create products"
