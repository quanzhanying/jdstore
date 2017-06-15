# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 # Initialize Admin User
  if User.find_by(email: "370369314@qq.com").nil?
    u = User.new
    u.email = "370369314@qq.com"           # 可以改成自己的 email
    u.password = "123456"                # 最少要六码
    u.password_confirmation = "123456"   # 最少要六码
    u.is_admin = true
    u.save
    puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
  else
    puts "Admin 已经建立过了，脚本跳过该步骤。"
  end

   # Initialize Product

    # Product.create!(title: "QC-35",
    #   description: "耳机",
    #   price: 2800,
    #   quantity: 5,
    #   image: open("https://images-cn.ssl-images-amazon.com/images/I/41bVSMLUllL._AC_UL320_SR320,320_.jpg")
    #   )
    #
    # Product.create!(title: "Iphone7",
    #   description: "手机",
    #   price: 5000,
    #   quantity: 5,
    #   image: open("https://images-cn.ssl-images-amazon.com/images/I/51q3gdJGenL._SL800_.jpg")
    #   )
    #
    # Product.create!(title: "Cherry Keyboard",
    #   description: "G80-3000键盘",
    #   price: 2800,
    #   quantity: 5,
    #   image: open("https://images-cn.ssl-images-amazon.com/images/I/41LN-bXtA7L._AC_UL320_SR320,320_.jpg")
    #   )
