# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.new(email: "admin@test.com", password: "123456", password_confirmation: "123456", is_admin: true)
u.save

puts "自动向数据库增加10条测试商品"
puts "Product，当前字段：title，description，price，quantity"

titles = ["手拎包","运动鞋","连衣裙","iPhone7","冬日羊毛袜子","蓝牙耳机","无线鼠标","细高跟高跟鞋","保湿乳液","护手霜"]

Product.delete_all
(1..10).each do |i|
  Product.create(title: titles[i-1], description:"等待添加商品描述", price: rand(500), quantity: rand(1000))
end

puts "商品添加完成！"
