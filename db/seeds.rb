# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#  Initialize admin user
u = User.new
u.email = "xiaoyingquan@163.com"

u.password = "111111"

u.password_confirmation = "111111"

u.is_admin = true
u.save

#Initialize product

Product.create!(title: "Aeron",
                 description: "Aeron",
                 price: 7999,
                 quantity: 10,
                 image: open("https://ooo.0o0.ooo/2017/06/05/5934cfd736565.jpeg")
                 )

Product.create!(title: "macbook",
                description: "macbook",
                price: 9999,
                quantity: 10,
                image: open("https://ws1.sinaimg.cn/large/006tNbRwgy1fga3wr7sp7j30zw0latcz.jpg")
                )

Product.create!(title: "iphone 7",
                description: "iphone 7",
                price: 5999,
                quantity: 10,
                image: open("https://ws1.sinaimg.cn/large/006tNbRwgy1fga3wr0z4fj30ge0akwfe.jpg")
                )
