# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "這個種子檔會自動建立一個admin帳號, 並且創建 12 個商品"

create_account =
  User.create([
    email: 'aa@aa.aa',
    password: '123456789',
    password_confirmation: '123456789',
    is_admin: 'true'])

puts "管理员账号建立"

create_jos =


    Product.create!([
      title: "捐助动物基金会",
      description: "别说话，捐钱就是了",
      quantity: 1000,
      price: 50,
      animal: "normal",
      is_hidden: 'true'
      ])
    Product.create!([
      title: "大脸猴子",
      description: "可爱的大脸猴子，产自中国，非常可爱~~",
      quantity: 250,
      price: 20000,
      animal: "hawk"
      ])
    Product.create!([
      title: "大脸猴子的媳妇",
      description: "大脸猴子的媳妇，同样产自中国，非常凶悍！！！",
      quantity: 1,
      price: 2,
      animal: "turtle"
      ])

puts "商品生成"
