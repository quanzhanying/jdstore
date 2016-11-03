# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "這個種子檔會自動建立一個admin帳號, 10个user帐号, 10个on sale products, 10个not on sale products, 10个已经用支付宝支付的订单，10个已经用微信支付的订单"

create_account = User.create([email: 'example@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'true'])
puts "Admin account created."

create_account = User.create([email: 'user1@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false'])
puts "User account created."

create_account = User.create([email: 'user2@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false'])
puts "User account created."

create_account = User.create([email: 'user3@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false'])
puts "User account created."

create_account = User.create([email: 'user4@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false'])
puts "User account created."

create_account = User.create([email: 'user5@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false'])
puts "User account created."

create_account = User.create([email: 'user6@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false'])
puts "User account created."

create_account = User.create([email: 'user7@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false'])
puts "User account created."

create_account = User.create([email: 'user8@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false'])
puts "User account created."

create_account = User.create([email: 'user9@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false'])
puts "User account created."

create_account = User.create([email: 'user10@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false'])
puts "User account created."



create_product = for i in 1..10 do
  Product.create!([title: "Product no.#{i}", description: "這是用種子建立的第 #{i} 個on sale product", price: rand(50..99)*100, quantity: rand(10..49)*100, onsale: "true"])
end
puts "10 on sale products created."

create_product = for i in 1..10 do
  Product.create!([title: "Product no.#{i+10}", description: "這是用種子建立的第 #{i+10} 個not on sale product", price: rand(50..99)*100, quantity: rand(10..49)*100, onsale: "false"])
end
puts "10 not on sale products created."

create_order = for i in 1..10 do
  Order.create!([user_id: rand(1..10), total: rand(50..99)*100 , billing_name: "#{i}This is billing name.", billing_address: "#{i}This is billing address.", shipping_name: "#{i}This is shipping name.", shipping_address: "#{i}This is shipping address.", is_paid: true, payment_method: "wechat", aasm_state: "paid"])
end
puts "10 oreders paid with wechat."

create_order = for i in 11..20 do
  Order.create!([user_id: rand(1..10), total: rand(50..99)*100 , billing_name: "#{i}This is billing name.", billing_address: "#{i}This is billing address.", shipping_name: "#{i}This is shipping name.", shipping_address: "#{i}This is shipping address.", is_paid: true, payment_method: "alipay", aasm_state: "paid"])
end
puts "10 orders paid with alipay."
