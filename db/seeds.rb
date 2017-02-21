# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

create_account = User.create([email: 'admin@test.com', password: '111111', password_confirmation: '111111', is_admin: 'true'])
puts "Admin account created."
create_account = User.create([email: 'admin2@test.com', password: '111111', password_confirmation: '111111', is_admin: 'true'])
puts "Admin account created."

create_account = User.create([email: 'buyer1@gmail.com', password: '111111', password_confirmation: '111111', is_admin: 'false'])
puts "User account created."
create_account = User.create([email: 'buyer2@gmail.com', password: '111111', password_confirmation: '111111', is_admin: 'false'])
puts "User account created."

create_product = for i in 1..10 do
  Product.create!([title: "Product no.#{i}", description: "這是用種子建立的第 #{i} 個 product", price: rand(50..99)*100, quantity: rand(10..49)*100])
end
puts "10 products created."


create_order = for i in 1..10 do
  Order.create!([user_id: rand(1..10), total: rand(50..99)*100 , billing_name: "#{i}This is billing name.", billing_address: "#{i}This is billing address.",
    shipping_name: "#{i}This is shipping name.", shipping_address: "#{i}This is shipping address.",
    is_paid: true, payment_method: "wechat", aasm_state: "paid"])
end
puts "10 orders paid with wechat."

create_order = for i in 11..20 do
  Order.create!([user_id: rand(1..10), total: rand(50..99)*100 , billing_name: "#{i}This is billing name.", billing_address: "#{i}This is billing address.",
    shipping_name: "#{i}This is shipping name.", shipping_address: "#{i}This is shipping address.",
    is_paid: true, payment_method: "alipay", aasm_state: "paid"])
end
puts "10 orders paid with alipay."
