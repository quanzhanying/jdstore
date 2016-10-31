# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts '建立预备资料库'

create_account = User.create([email: 'liangchaob@163.com', password: 'P@ssw0rd', password_confirmation: 'P@ssw0rd',is_admin: 'true'])
puts "管理员建立成功."

create_account = User.create([email: 'idk2idk2@126.com', password: 'P@ssw0rd', password_confirmation: 'P@ssw0rd'])
puts "顾客建立成功"

create_a_lot_accounts = for i in 1..10 do
    User.create([email: "#{i}@jd.com", password: 'P@ssw0rd', password_confirmation: 'P@ssw0rd'])
end
puts "建立一些路人成功，用户名1~10@jd.com"


create_products_on = for i in 1..10 do
    Product.create!([title: "尸体 no.#{i * 100}",description: "这个使用seed创建的第 #{i} 具尸体",quantity: rand(2..6),price: rand(40..60)])
end
puts "10具上架尸体建立成功"

create_products_off = for i in 1..10 do
    Product.create!([title: "尸体 no.#{(i+10)*100}",description: "这个使用seed创建的第 #{i} 具尸体",quantity: rand(2..6),price: rand(40..60),is_hidden: 'true'])
end
puts "10具不上架尸体建立成功"