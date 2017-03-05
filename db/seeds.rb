# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.new
u.email = "admin@text.com"

u.password = "000000"

u.password_confirmation = "000000"

u.is_admin = true
u.save

Product.create!(title: "可水洗舒柔丝羽绒枕",
                description: "柔软舒适深睡眠",
                price: 59,
                quantity: 10,
                image: open("https://ooo.0o0.ooo/2017/03/04/58ba649aeaadd.png")
                )
