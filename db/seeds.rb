# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# u = User.new
# u.email = "1028235747@qq.com"           # 可以改成自己的 email
#
# u.password = "123456"                # 最少要六码
#
# u.password_confirmation = "123456"   # 最少要六码
#
# u.is_admin = true
# u.save

# 新建商品
#1
p1 = Product.create(title: "青海湖5日深度休闲游",
                   description: "青海湖又名“库库淖尔”，即蒙语“青色的海”之意。由祁连山的大通山、日月山与青海南山之间的断层陷落形成。",
                   price: 12000,
                   quantity: 10,
                  
                    )
p1.photos.create!(image: open("http://oqjdhoq9e.bkt.clouddn.com/%E9%9D%92%E6%B5%B7%E6%B9%961.jpg"))
# p1.photos.create!(image: open("http://oqjdhoq9e.bkt.clouddn.com/%E9%9D%92%E6%B5%B7%E6%B9%962.jpg"))
# p1.photos.create!(image: open("http://oqjdhoq9e.bkt.clouddn.com/%E9%9D%92%E6%B5%B7%E6%B9%963.jpg"))
# p1.photos.create!(image: open("http://oqjdhoq9e.bkt.clouddn.com/%E9%9D%92%E6%B5%B7%E6%B9%964.jpg"))
