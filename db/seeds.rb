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

products = [{title:"Fashion Normal",
	        description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
	        image_path: "#{Rails.root}/public/images/sample-fashion-1.jpg"},

	        {title:"Events Normal",
	        description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
	        image_path: "#{Rails.root}/public/images/sample-events-1.jpg"},

          {title:"Nature Normal",
	        description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
	        image_path: "#{Rails.root}/public/images/sample-nature-1.jpg"},

          {title:"Model Normal",
	        description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
	        image_path: "#{Rails.root}/public/images/sample-models-1.jpg"},

					{title:"Fashion Premium",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/sample-fashion-2.jpg"},

					{title:"Events Premium",
	        description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
	        image_path: "#{Rails.root}/public/images/sample-events-2.jpg"},

          {title:"Nature Premium",
	        description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
	        image_path: "#{Rails.root}/public/images/sample-nature-2.jpg"},

          {title:"Model Premium",
	        description: "TWe help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
	        image_path: "#{Rails.root}/public/images/sample-models-2.jpg"}]

p1 = Product.create([title:products[0][:title],description:products[0][:description],quantity:20,price:12000,image:open(products[0][:image_path])])
p2 = Product.create([title:products[1][:title],description:products[1][:description],quantity:20,price:10000,image:open(products[1][:image_path])])
p3 = Product.create([title:products[2][:title],description:products[2][:description],quantity:20,price:8000,image:open(products[2][:image_path])])
p4 = Product.create([title:products[3][:title],description:products[3][:description],quantity:20,price:15000,image:open(products[3][:image_path])])
p5 = Product.create([title:products[4][:title],description:products[4][:description],quantity:20,price:24000,image:open(products[4][:image_path])])
p6 = Product.create([title:products[5][:title],description:products[5][:description],quantity:20,price:18000,image:open(products[5][:image_path])])
p7 = Product.create([title:products[6][:title],description:products[6][:description],quantity:20,price:18000,image:open(products[6][:image_path])])
p8 = Product.create([title:products[7][:title],description:products[7][:description],quantity:20,price:32000,image:open(products[7][:image_path])])

puts "create products"
