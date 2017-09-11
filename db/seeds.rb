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


Product.create!(title: "长方形藤编篮子",
   description: "可叠放使用的藤编篮子。活用了其容易弯曲、肌肤触感光滑的长处，是温暖的手工编制商品。",
   price: 248,
   quantity: 30,
   category: "收纳品",
   yieldly: "日本",
   particulars: "天然的材质，呈现质朴的感觉<br>适合收纳各种杂物<br>可堆叠使用<br><br>应用场景<br><img alt=\"\" src=\"http://ww3.sinaimg.cn/large/006tKfTcgy1ffr52b0kiej30ue0mimz4.jpg\">",
   )

Product.create!(title: "抽屉式收纳盒",
   description: "充分利用空间，方便拿取，经久耐用。",
   price: 99,
   quantity: 30,
   category: "收纳品",
   yieldly: "日本",
   particulars: "抽屉式设计的pp材质收纳盒<br>
通过堆叠能充分利用空间，且方便拿取物品<br>
pp材质安全无毒，经久耐用<br>
此产品适合存放衣物<br>
人人必备的经典产品﻿<br><br>
应用场景< img alt=\"\" src=\"https://ooo.0o0.ooo/2017/05/16/591a9d7354cee.jpg\">",
   )

Product.create!(title: "长方形木制托盘",
   description: "白蜡木 尺寸：46×35cm",
   price: 248,
   quantity: 30,
   category: "收纳品",
   yieldly: "日本",
   particulars: "具有天然纹理的托盘，适合盛放食物和小物件，让桌面看起来更整洁美观<br><br>应用场景< img alt=\"\" src=\"https://ooo.0o0.ooo/2017/05/16/591a9d7354cee.jpg\">",
   )

Product.create!(title: "透明亚克力收纳盒",
   description: "物品清晰可见",
   price: 129,
   quantity: 30,
   category: "收纳品",
   yieldly: "日本",
   particulars: "透明亚克力材质，经久耐用，物品清晰可见<br>抽屉式设计，易于拿取<br>适合收纳化妆品及文具等小物件<br><br>应用场景<br><img alt=\"\" src=\"http://ww1.sinaimg.cn/large/006tNbRwgy1fftw9k4j29j30gl0giqid.jpg\">",
   )

Product.create!(title: "全棉四件套",
   description: "规格：1.5米*2米",
   price: 248,
   quantity: 30,
   category: "装饰品",
   yieldly: "中国",
   particulars: "优质埃及长绒棉打造，带来柔软亲肤的触感<br>清新淡雅的色调，令身心平静<br><br>应用场景<br><img alt=\"\" src=\"http://ww4.sinaimg.cn/large/006tKfTcgy1ffr5mxwk1hj30gj0gbk7a.jpg\">",
   )


Product.create!(title: "天鹅绒靠垫",
   description: "亲肤的纯色面料，色彩淡雅",
   price: 69,
   quantity: 20,
   category: "装饰品",
   yieldly: "中国",
   particulars: "淡雅的纯色，易于于各种家居环境搭配<br>亲肤天鹅绒面料，一触难忘<br><br>应用场景<br><img alt=\"\" src=\"http://ww1.sinaimg.cn/large/006tNbRwgy1fftw3gwk5kj30jq0jc1kx.jpg\">",
   )

Product.create!(title: "小型琴叶榕",
   description: "高度约60cm（含盆）",
   price: 59,
   quantity: 50,
   category: "装饰品",
   yieldly: "中国",
   particulars: "琴叶榕是非常适合在室内种植的植物，造型优雅<br>成活率高，易于打理<br><br>应用场景<br><img alt=\"\" src=\"http://ww1.sinaimg.cn/large/006tNbRwgy1fftw5bii0cj30d5084753.jpg\">",
   )

Product.create!(title: "艺术版画",
   description: "规格：60cm*60cm",
   price: 499,
   quantity: 10,
   category: "装饰品",
   yieldly: "中国",
   particulars: "作品充满诗意优雅的氛围，色彩丰富而自然<br>非常适合在卧室、客厅、书房悬挂<br><br>应用场景<br><img alt=\"\" src=\"http://ww4.sinaimg.cn/large/006tNbRwgy1fftvuqz9rrj30hr0hn0ua.jpg\">",
   )
