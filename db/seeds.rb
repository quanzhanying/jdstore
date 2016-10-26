# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts '建立预备资料库'

create_account = User.create([email: 'liangchaob@163.com', password: 'P@ssw0rd', password_confirmation: 'P@ssw0rd'])
puts "管理员建立成功."

create_account = User.create([email: 'idk2idk2@126.com', password: 'P@ssw0rd', password_confirmation: 'P@ssw0rd'])
puts "顾客建立成功"

create_jos = for i in 1..10 do
    Product.create!([title: "尸体 no.#{i}",description: "这个使用seed创建的第 #{i} 具尸体",quantity: rand(2..6),price: rand(40..60)])
end
puts "10具尸体建立成功"