# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.new
u.email = "zhongjie10@gmail.com"
u.password = "2017febFeb"
u.password_confirmation = "2017febFeb"
u.is_admin = true
u.save

p = Product.new
p.title = "Mac Pro 13"
p.description = "test description"
p.quantity = 10
p.price = 105
p.save
