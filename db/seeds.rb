# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "这个种子档会自动建立一个admin账号, 并且创建20个products"

create_account = User.create([email: "aabb@cc.com", password:"aabbcc",password_confirmation: "aabbcc",is_admin:"true"])

puts "Admin account created."

products_demo = [["product1","description1"
],["product2","description2"
],["product3","description3"
],["product4","description4"
],["product5","description5"
],["product6","description6"
]
]

create_products = for i in 1..20 do
product_test = products_demo[rand(0..5)]
Product.create!([title: product_test[0], description: product_test[1], quantity: rand(0..20), price: rand(10..50)*100+99])
end

puts "20 products created."
