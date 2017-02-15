# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.new
u.email = "ksalsqzhbl@aliyun.com"           # 可以改成自己的 email

u.password = "123456"                # 最少要六码

u.password_confirmation = "123456"   # 最少要六码

u.is_admin = true
u.save

puts "16 products created"

products_categories = ["器乐", "书","线上课","线下课"]
products_description = [1,2,3,4]
products_prices = [1,2,3,4]
create_products = for i in 1..4 do
Product.create!([title: products[i - 1],
description: products_description[i - 1],
quantity: rand(0..10),
price: products_prices[i - 1],
image: File.open(File.join(Rails.root, products_images[i-1])),
categories: products_categories[i-1] ])
end
