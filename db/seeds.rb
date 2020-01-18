# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.new
u.email = ENV["admin_email"] # 可以改成自己的 email

u.password = "123456"      # 最少要六碼

u.password = "123456"      # 最少要六碼

u.is_admin = true
u.save

Category.create! :title => '化學飾品', :weight => 30, :parent => Category.create!(:title => '預設第一級分類')
Category.create! :title => '化學玩物', :weight => 20, :parent => Category.first
Category.create! :title => '創意化學', :weight => 10 , :parent => Category.first


Product.create!(title: "試管天氣瓶", description: "隨天氣變化而改變結晶狀態", quantity: 10, price: 200, msrp: 300, status: "on", category: Category.first.children.first)
Product.create!(title: "水滴天氣瓶", description: "隨天氣變化而改變結晶狀態", quantity: 5, price: 249, msrp: 349, status: "on", category: Category.first.children.first)
Product.create!(title: "星空瓶", description: "暗室下會綻放微弱光芒", quantity: 3, price: 299, msrp: 399, status: "on", category: Category.first.children.first)
Product.create!(title: "試管盆栽", description: "讓植物在試管中展現線條美", quantity: 6, price: 39, msrp: 79, status: "on", category: Category.first.children.first)
Product.create!(title: "分子模型", description: "玻璃製模型，具觀賞性又富教育性質", quantity: 2, price: 199, msrp: 250, status: "on", category: Category.first.children.second)
Product.create!(title: "燒杯蠟燭", description: "蠟凍有淡淡的芬芳氣息", quantity: 8, price: 99, msrp: 150, status: "on", category: Category.first.children.second)
Product.create!(title: "化學郵票", description: "郵票迷不可不收藏的創意郵票", quantity: 20, price: 49, msrp: 69, status: "on", category: Category.first.children.third)
Product.create!(title: "分子項鍊", description: "8K金打造", quantity: 3, price: 249, msrp: 299, status: "on", category: Category.first.children.third)
Product.create!(title: "元素週期表壁貼", description: "讓你的居家也充滿化學知性氣息", quantity: 2, price: 199, msrp: 300, status: "on", category: Category.first.children.third)

ProductImage.create!(product: Product.find_by(title: '水滴天氣瓶'), image: open("https://res.cloudinary.com/hzvz7zv2w/image/upload/v1579343074/pic%20assets/strom_glass_2_jymj9n.jpg"))
ProductImage.create!(product: Product.find_by(title: '試管天氣瓶'), image: open("https://res.cloudinary.com/hzvz7zv2w/image/upload/v1579343075/pic%20assets/Storm_Glass_vxixuv.jpg"))
ProductImage.create!(product: Product.find_by(title: '星空瓶'), image: open("https://res.cloudinary.com/hzvz7zv2w/image/upload/v1579343073/pic%20assets/star_bottles_zjonst.jpg"))
ProductImage.create!(product: Product.find_by(title: '試管盆栽'), image: open("https://res.cloudinary.com/hzvz7zv2w/image/upload/v1579343074/pic%20assets/tubed_plant_rixjkx.jpg"))
ProductImage.create!(product: Product.find_by(title: '分子模型'), image: open("https://res.cloudinary.com/hzvz7zv2w/image/upload/v1579343080/pic%20assets/molecule_model_rbyzkx.png"))
ProductImage.create!(product: Product.find_by(title: '燒杯蠟燭'), image: open("https://res.cloudinary.com/hzvz7zv2w/image/upload/v1579343073/pic%20assets/beaker_candle_xhiotx.jpg"))
ProductImage.create!(product: Product.find_by(title: '化學郵票'), image: open("https://res.cloudinary.com/hzvz7zv2w/image/upload/v1579343073/pic%20assets/chemistry_stamp_of7bqp.jpg"))
ProductImage.create!(product: Product.find_by(title: '分子項鍊'), image: open("https://res.cloudinary.com/hzvz7zv2w/image/upload/v1579343072/pic%20assets/molecule_necklace_pais8x.jpg"))
ProductImage.create!(product: Product.find_by(title: '元素週期表壁貼'), image: open("https://res.cloudinary.com/hzvz7zv2w/image/upload/v1579343074/pic%20assets/Periodic_Table_ilwbkj.png"))
