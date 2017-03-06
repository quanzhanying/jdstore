# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u=User.new
u.email= "xyy123@gmail.com"
u.password= "xyy123"
u.password_confirmation="xyy123"
u.is_admin=true
u.save






Product.create!(title:"家庭聚会包",quantity:100,price:20,kind:"set",
owner:"shop1",place:"夏威夷",image: open("https://s-media-cache-ak0.pinimg.com/originals/2d/82/ab/2d82abeb70b90f818be18beed57c7e28.png"))
