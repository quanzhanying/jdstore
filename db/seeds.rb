# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# ---新增admin种子档---

if User.find_by(email: "admin@123.com").nil?
  u = User.new
  u.email = "admin@123.com"           # 可以改成自己的 email
  u.password = "123456"                # 最少要六码
  u.password_confirmation = "123456"   # 最少要六码
  u.is_admin = true
  u.save
  puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
else
  puts "Admin 已经建立过了，脚本跳过该步骤。"
end


# Initialize Product

Product.create!(title: "可重叠长方形藤编篮子",
  description: "可叠放使用的藤编篮子。活用了其容易弯曲、肌肤触感光滑的长处，是温暖的手工编制商品。",
  price: 248,
  quantity: 30,
  image: open("http://img.muji.com.cn/img/item/4945247381306_400.jpg"),
  category: "收纳品",
  yieldly: "日本",
  particulars: "<img alt=\"\" src=\"https://ooo.0o0.ooo/2017/05/16/591a9d7354cee.jpg\">PP收纳用轮子 / 原色4个入<br>适用于PP商品的轮子。<br><img alt=\"\" src=\"https://ooo.0o0.ooo/2017/05/16/591a9d7354cee.jpg\">",
  )
