# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.new
u.email = "1@1"           # 可以改成自己的 email

u.password = "123123"                # 最少要六码

u.password_confirmation = "123123"   # 最少要六码

u.is_admin = true
u.save

puts "這個種子檔會自動建立一個admin帳號, 並且創建 10 個 public jobs, 以及10個hidden jobs"

create_account = User.create([email: 't@t', password: '123123', password_confirmation: '123123', is_admin: 'true'])
puts "Admin account created."
create_account = User.create([email: 'u@u', password: '123123', password_confirmation: '123123'])
puts "顾客建立成功"


create_jos = for i in 1..10 do
  Product.create!([title: "Product no.#{i}", description: "这是用种子程序生产的第 #{i} 个小僵尸", quantity: rand(2..6), price: rand(50..99)*100])
end
puts "10 僵尸产品 created."
