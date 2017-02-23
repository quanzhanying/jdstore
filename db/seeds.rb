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


products = [{title:"Fashion",
	        description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
	        image_path: "#{Rails.root}/public/images/1.jpg"},

					{title:"Fashion",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/2.jpg"},

					{title:"Fashion",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/3.jpg"},

					{title:"Fashion",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/4.jpg"},

					{title:"Fashion",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/party1.jpg"},

					{title:"Fashion",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/party2.jpg"},

					{title:"Fashion",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/party3.jpg"},

					{title:"Fashion",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/party4.jpg"},

					{title:"Fashion",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/product1.jpg"},

					{title:"Fashion",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/product2.jpg"},

					{title:"Fashion",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/product3.jpg"},

					{title:"Fashion",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/product4.jpg"},

					{title:"Fashion",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/wedding1.jpg"},

					{title:"Fashion",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/wedding2.jpg"},

					{title:"Fashion",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/wedding3.jpg"},

					{title:"Fashion",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/wedding4.jpg"},


	        {title:"Events",
	        description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
	        image_path: "#{Rails.root}/public/images/shoes1.jpg"},

					{title:"Events",
	        description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
	        image_path: "#{Rails.root}/public/images/shoes2.jpg"},

					{title:"Events",
	        description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
	        image_path: "#{Rails.root}/public/images/shoes3.jpg"},

					{title:"Events",
	        description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
	        image_path: "#{Rails.root}/public/images/shoes4.jpg"},

					{title:"Events",
	        description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
	        image_path: "#{Rails.root}/public/images/accessory1.jpg"},

					{title:"Events",
	        description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
	        image_path: "#{Rails.root}/public/images/accessory2.jpg"},

					{title:"Events",
	        description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
	        image_path: "#{Rails.root}/public/images/accessory3.jpg"},

					{title:"Events",
	        description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
	        image_path: "#{Rails.root}/public/images/accessory4.jpg"},

					{title:"Events",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/watch1.jpg"},

					{title:"Events",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/watch2.jpg"},

					{title:"Events",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/watch3.jpg"},

					{title:"Events",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/watch4.jpg"},

					{title:"Events",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/purse1.jpg"},

					{title:"Events",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/purse2.jpg"},

					{title:"Events",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/purse3.jpg"},

					{title:"Events",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/purse4.jpg"},


          {title:"Nature",
	        description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
	        image_path: "#{Rails.root}/public/images/suit1.jpg"},

					{title:"Nature",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/suit2.jpg"},

					{title:"Nature",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/suit3.jpg"},

					{title:"Nature",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/suit4.jpg"},

					{title:"Nature",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/shirt1.jpg"},

					{title:"Nature",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/shirt2.jpg"},

					{title:"Nature",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/shirt3.jpg"},

					{title:"Nature",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/shirt4.jpg"},

					{title:"Nature",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/sport1.jpg"},

					{title:"Nature",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/sport2.jpg"},

					{title:"Nature",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/sport3.jpg"},

					{title:"Nature",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/sport4.jpg"},

					{title:"Nature",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/jacket1.jpg"},

					{title:"Nature",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/jacket2.jpg"},

					{title:"Nature",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/jacket3.jpg"},

					{title:"Nature",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/jacket4.jpg"},

					{title:"Model",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/boots1.jpg"},

					{title:"Model",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/boots2.jpg"},

					{title:"Model",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/boots3.jpg"},

					{title:"Model",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/boots4.jpg"},

					{title:"Model",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/glasses1.jpg"},

					{title:"Model",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/glasses2.jpg"},

					{title:"Model",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/glasses3.jpg"},

					{title:"Model",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/glasses4.jpg"},

					{title:"Model",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/watches1.jpg"},

					{title:"Model",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/watches2.jpg"},

					{title:"Model",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/watches3.jpg"},

					{title:"Model",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/watches4.jpg"},

					{title:"Model",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/accessories1.jpg"},

					{title:"Model",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/accessories2.jpg"},

					{title:"Model",
					description: "We help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
					image_path: "#{Rails.root}/public/images/accessories3.jpg"},


          {title:"Model",
	        description: "TWe help millions of designers, writers, artists, programmers and other creators to get access to beautiful photos that they can use freely which empowers them to create amazing products, designs, stories, websites, apps, art and other work.",
	        image_path: "#{Rails.root}/public/images/accessories4.jpg"}]

p1 = Product.create([title:products[0][:title],description:products[0][:description],quantity:20,price:12000,image:open(products[0][:image_path])])
p2 = Product.create([title:products[1][:title],description:products[1][:description],quantity:20,price:10000,image:open(products[1][:image_path])])
p3 = Product.create([title:products[2][:title],description:products[2][:description],quantity:20,price:8000,image:open(products[2][:image_path])])
p4 = Product.create([title:products[3][:title],description:products[3][:description],quantity:20,price:15000,image:open(products[3][:image_path])])
p5 = Product.create([title:products[4][:title],description:products[4][:description],quantity:20,price:24000,image:open(products[4][:image_path])])
p6 = Product.create([title:products[5][:title],description:products[5][:description],quantity:20,price:18000,image:open(products[5][:image_path])])
p7 = Product.create([title:products[6][:title],description:products[6][:description],quantity:20,price:18000,image:open(products[6][:image_path])])
p8 = Product.create([title:products[7][:title],description:products[7][:description],quantity:20,price:32000,image:open(products[7][:image_path])])
p9 = Product.create([title:products[0][:title],description:products[0][:description],quantity:20,price:12000,image:open(products[0][:image_path])])
p10 = Product.create([title:products[1][:title],description:products[1][:description],quantity:20,price:10000,image:open(products[1][:image_path])])
p11 = Product.create([title:products[2][:title],description:products[2][:description],quantity:20,price:8000,image:open(products[2][:image_path])])
p12 = Product.create([title:products[3][:title],description:products[3][:description],quantity:20,price:15000,image:open(products[3][:image_path])])
p13 = Product.create([title:products[4][:title],description:products[4][:description],quantity:20,price:24000,image:open(products[4][:image_path])])
p14 = Product.create([title:products[5][:title],description:products[5][:description],quantity:20,price:18000,image:open(products[5][:image_path])])
p15 = Product.create([title:products[6][:title],description:products[6][:description],quantity:20,price:18000,image:open(products[6][:image_path])])
p16 = Product.create([title:products[7][:title],description:products[7][:description],quantity:20,price:32000,image:open(products[7][:image_path])])
p17 = Product.create([title:products[0][:title],description:products[0][:description],quantity:20,price:12000,image:open(products[0][:image_path])])
p18 = Product.create([title:products[1][:title],description:products[1][:description],quantity:20,price:10000,image:open(products[1][:image_path])])
p19 = Product.create([title:products[2][:title],description:products[2][:description],quantity:20,price:8000,image:open(products[2][:image_path])])
p20 = Product.create([title:products[3][:title],description:products[3][:description],quantity:20,price:15000,image:open(products[3][:image_path])])
p21 = Product.create([title:products[4][:title],description:products[4][:description],quantity:20,price:24000,image:open(products[4][:image_path])])
p22 = Product.create([title:products[5][:title],description:products[5][:description],quantity:20,price:18000,image:open(products[5][:image_path])])
p23 = Product.create([title:products[6][:title],description:products[6][:description],quantity:20,price:18000,image:open(products[6][:image_path])])
p24 = Product.create([title:products[7][:title],description:products[7][:description],quantity:20,price:32000,image:open(products[7][:image_path])])
p25 = Product.create([title:products[0][:title],description:products[0][:description],quantity:20,price:12000,image:open(products[0][:image_path])])
p26 = Product.create([title:products[1][:title],description:products[1][:description],quantity:20,price:10000,image:open(products[1][:image_path])])
p27 = Product.create([title:products[2][:title],description:products[2][:description],quantity:20,price:8000,image:open(products[2][:image_path])])
p28 = Product.create([title:products[3][:title],description:products[3][:description],quantity:20,price:15000,image:open(products[3][:image_path])])
p29 = Product.create([title:products[4][:title],description:products[4][:description],quantity:20,price:24000,image:open(products[4][:image_path])])
p30 = Product.create([title:products[5][:title],description:products[5][:description],quantity:20,price:18000,image:open(products[5][:image_path])])
p31 = Product.create([title:products[6][:title],description:products[6][:description],quantity:20,price:18000,image:open(products[6][:image_path])])
p32 = Product.create([title:products[7][:title],description:products[7][:description],quantity:20,price:32000,image:open(products[7][:image_path])])
p33 = Product.create([title:products[0][:title],description:products[0][:description],quantity:20,price:12000,image:open(products[0][:image_path])])
p34 = Product.create([title:products[1][:title],description:products[1][:description],quantity:20,price:10000,image:open(products[1][:image_path])])
p35 = Product.create([title:products[2][:title],description:products[2][:description],quantity:20,price:8000,image:open(products[2][:image_path])])
p36 = Product.create([title:products[3][:title],description:products[3][:description],quantity:20,price:15000,image:open(products[3][:image_path])])
p37 = Product.create([title:products[4][:title],description:products[4][:description],quantity:20,price:24000,image:open(products[4][:image_path])])
p38 = Product.create([title:products[5][:title],description:products[5][:description],quantity:20,price:18000,image:open(products[5][:image_path])])
p39 = Product.create([title:products[6][:title],description:products[6][:description],quantity:20,price:18000,image:open(products[6][:image_path])])
p40 = Product.create([title:products[7][:title],description:products[7][:description],quantity:20,price:32000,image:open(products[7][:image_path])])
p41 = Product.create([title:products[0][:title],description:products[0][:description],quantity:20,price:12000,image:open(products[0][:image_path])])
p42 = Product.create([title:products[1][:title],description:products[1][:description],quantity:20,price:10000,image:open(products[1][:image_path])])
p43 = Product.create([title:products[2][:title],description:products[2][:description],quantity:20,price:8000,image:open(products[2][:image_path])])
p44 = Product.create([title:products[3][:title],description:products[3][:description],quantity:20,price:15000,image:open(products[3][:image_path])])
p45 = Product.create([title:products[4][:title],description:products[4][:description],quantity:20,price:24000,image:open(products[4][:image_path])])
p46 = Product.create([title:products[5][:title],description:products[5][:description],quantity:20,price:18000,image:open(products[5][:image_path])])
p47 = Product.create([title:products[6][:title],description:products[6][:description],quantity:20,price:18000,image:open(products[6][:image_path])])
p48 = Product.create([title:products[7][:title],description:products[7][:description],quantity:20,price:32000,image:open(products[7][:image_path])])
p49 = Product.create([title:products[0][:title],description:products[0][:description],quantity:20,price:12000,image:open(products[0][:image_path])])
p50 = Product.create([title:products[1][:title],description:products[1][:description],quantity:20,price:10000,image:open(products[1][:image_path])])
p51 = Product.create([title:products[2][:title],description:products[2][:description],quantity:20,price:8000,image:open(products[2][:image_path])])
p52 = Product.create([title:products[3][:title],description:products[3][:description],quantity:20,price:15000,image:open(products[3][:image_path])])
p53 = Product.create([title:products[4][:title],description:products[4][:description],quantity:20,price:24000,image:open(products[4][:image_path])])
p54 = Product.create([title:products[5][:title],description:products[5][:description],quantity:20,price:18000,image:open(products[5][:image_path])])
p55 = Product.create([title:products[6][:title],description:products[6][:description],quantity:20,price:18000,image:open(products[6][:image_path])])
p56 = Product.create([title:products[7][:title],description:products[7][:description],quantity:20,price:32000,image:open(products[7][:image_path])])
p57 = Product.create([title:products[0][:title],description:products[0][:description],quantity:20,price:12000,image:open(products[0][:image_path])])
p58 = Product.create([title:products[1][:title],description:products[1][:description],quantity:20,price:10000,image:open(products[1][:image_path])])
p59 = Product.create([title:products[2][:title],description:products[2][:description],quantity:20,price:8000,image:open(products[2][:image_path])])
p60 = Product.create([title:products[3][:title],description:products[3][:description],quantity:20,price:15000,image:open(products[3][:image_path])])
p61 = Product.create([title:products[4][:title],description:products[4][:description],quantity:20,price:24000,image:open(products[4][:image_path])])
p62 = Product.create([title:products[5][:title],description:products[5][:description],quantity:20,price:18000,image:open(products[5][:image_path])])
p63 = Product.create([title:products[6][:title],description:products[6][:description],quantity:20,price:18000,image:open(products[6][:image_path])])
p64 = Product.create([title:products[7][:title],description:products[7][:description],quantity:20,price:32000,image:open(products[7][:image_path])])

puts "create products"
