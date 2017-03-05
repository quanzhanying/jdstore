# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


 Product.create!(title: "手机",
                 description: "超级好用",
                 price: 2000,
                 quantity: 100,
                 image:open("http://f2c.139shop.com/wareimg/0-0/res/goods/JPG/201511/20/28146.JPG")
                 )
