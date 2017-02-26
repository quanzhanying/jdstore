# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

puts 'seed 数据自动创建'

User.create(email: "cw@test.com", password: "123456", password_confirmation: "123456", is_admin: 'false')
puts 'create user: cw@test.com,  not admin'

User.create(email: "admin@test.com", password: "123456", password_confirmation: "123456", is_admin: 'true')
puts 'create user: admin@test.com,  is admin'
=begin
for i in 1..5 do
  Product.create(title: "Product#{i}", description: "description#{i}", quantity: i*10, price: i*100)
end
puts 'create product : 5'
=end

puts '从josn文件导入趣玩网商品数据'
