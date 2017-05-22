# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.new
u.email = "123@123.com"           # 可以改成自己的 email

u.password = "123456"                # 最少要六码

u.password_confirmation = "123456"   # 最少要六码

u.is_admin = true
u.save

Product.create!(title: "1",
                 description: "1",
                 price: 1,
                 quantity: 1,
                 image: open("https://ws3.sinaimg.cn/large/006tNc79ly1fftx4k69qtj318y0u0u0x.jpg")
                 )

Product.create!(title: "2",
                description: "2",
                price: 2,
                quantity: 2,
                image: open("https://ws3.sinaimg.cn/large/006tNc79ly1fftx6n69exj31900u0kjl.jpg")
                )
