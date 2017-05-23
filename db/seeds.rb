# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


u = User.new
u.email = "nihao@163.com"           # 可以改成自己的 email

u.password = "123456"                # 最少要六码

u.password_confirmation = "123456"   # 最少要六码

u.is_admin = true
u.save
 # Initialize Admin User
  if User.find_by(email: "nihao@163.com").nil?
    u = User.new
    u.email = "nihao@163.com"           # 可以改成自己的 email
    u.password = "123456"                # 最少要六码
    u.password_confirmation = "123456"   # 最少要六码
    u.is_admin = true
    u.save
    puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
  else
    puts "Admin 已经建立过了，脚本跳过该步骤。"
  end


 # Initialize Product

   

  Product.create!(title: "wine1",
    description: "酒1",
    price: 2800,
    quantity: 5,
    image: open("https://cdn.pixabay.com/photo/2011/03/25/08/27/wine-5884__340.jpg")
    )

  Product.create!(title: "wine2",
    description: "酒2",
    price: 2800,
    quantity: 5,
    image: open("https://cdn.pixabay.com/photo/2013/07/12/16/28/bordeaux-150955__340.png")
    )

  Product.create!(title: "wine3",
    description: "酒3",
    price: 2800,
    quantity: 5,
    image: open("https://cdn.pixabay.com/photo/2014/08/24/16/48/wine-426466__340.jpg")
    )

  Product.create!(title: "wine4",
    description: "酒4",
    price: 2800,
    quantity: 5,
    image: open("https://cdn.pixabay.com/photo/2014/08/26/19/19/wine-428313__340.jpg")
    )

  Product.create!(title: "wine5",
    description: "酒5",
    price: 2800,
    quantity: 5,
    image: open("https://cdn.pixabay.com/photo/2015/03/24/06/40/bottle-687147__340.jpg")
    )

  Product.create!(title: "wine6",
    description: "酒6",
    price: 2800,
    quantity: 5,
    image: open("https://cdn.pixabay.com/photo/2017/04/13/16/32/wine-2228066__340.jpg")
    )

  Product.create!(title: "wine7",
    description: "酒7",
    price: 2800,
    quantity: 5,
    image: open("https://cdn.pixabay.com/photo/2017/05/14/22/43/wine-2313297__340.jpg")
    )

  Product.create!(title: "wine8",
    description: "酒8",
    price: 2800,
    quantity: 5,
    image: open("https://cdn.pixabay.com/photo/2016/02/19/11/45/wine-bottle-1209934__340.jpg")
    )
