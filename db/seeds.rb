# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "這個種子檔會自動建立一個admin帳號, 並且創建 10 個 public jobs, 以及10個hidden jobs"

create_account = User.create([email: 't@t', password: '123123', password_confirmation: '123123', is_admin: 'true'])
puts "Admin account created."

create_jos = for i in 1..10 do
  Product.create!([title: "Product no.#{i}", description: "這是用種子建立的第 #{i} 個Public工作", price: rand(50..99)*100])
end
puts "10 Public products created."
