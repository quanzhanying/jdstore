# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


u = User.create([ email: 'a@a.com' ,  password: '123456' ,password_confirmation:'123456',is_admin:true])
puts "create a adminer"

p1 = Product.create([title:"phone",description:"this is a phone",quantity:20,price:30])
p2 = Product.create([title:"watch",description:"this is a watch",quantity:20,price:10])
puts "create products"