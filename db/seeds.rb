# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.new
u.email = "1@qq.com"           # 可以改成自己的 email

u.password = "111111"                # 最少要六码

u.password_confirmation = "111111"   # 最少要六码

u.is_admin = true
u.save

create_product = Product.create([title: '苹果IMac 27寸 8G内存 标配',
                                description: '3.2Ghz Core i5 处理器/8GB内存/1TB存储/2GB独显/Retina 5K屏 MK462CH/A',
                                quantity: '10',
                                price: '13000'])
puts "product 'IMac' created."

create_product = Product.create([title: 'Iphone7 128G 玫瑰金',
                                description: 'Apple iPhone 7 (A1660) 128G 玫瑰金色',
                                quantity: '10',
                                price: '5900'])
puts "product 'Iphone7' created."
