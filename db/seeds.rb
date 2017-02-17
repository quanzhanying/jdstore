# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.new
u.email = "asdfg@gmail.com"           # 可以改成自己的 email
u.password = "111111"                # 最少要六码
u.password_confirmation = "111111"   # 最少要六码
u.is_admin = true
u.save

puts "建立一个admin账号：example@gmail.com,12345678. 并添加10个products."

create_account = User.create([email: 'example@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'true'])
puts "Admin account created."
create_products = for i in 1..10 do
  Product.create!([title: "Product no.#{i}", description: "这是用seed.rb建立的第 #{i} 个Product", quantity: 100, price: rand(50..99)*100])
end
puts "10 products created."
