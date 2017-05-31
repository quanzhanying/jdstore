# Initialize Admin User
 if User.find_by(email: "admin@test.com").nil?
   u = User.new
   u.email = "1@1.com"           # 可以改成自己的 email
   u.password = "123456"                # 最少要六码
   u.password_confirmation = "123456"   # 最少要六码
   u.is_admin = true
   u.save
   puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
 else
   puts "Admin 已经建立过了，脚本跳过该步骤。"
 end
 # Initialize Product

 Product.create!(title: "放学托管",
   description: "适合工作繁忙的家庭，保证小孩有人照顾",
   price: 100,
   quantity: 50,
   image: open("http://oqr2tkodq.bkt.clouddn.com/%E6%94%BE%E5%AD%A6%E6%89%98%E7%AE%A1.jpg")
   )

 Product.create!(title: "包子／饺子",
   description: "自家手工无添加包子饺子，食材健康安全",
   price: 10,
   quantity: 500,
   image: open("http://oqr2tkodq.bkt.clouddn.com/%E5%8C%85%E5%AD%90%E9%A5%BA%E5%AD%90.jpg")
   )

 Product.create!(title: "脐橙",
   description: "正宗赣南脐橙，绿色种植无农药",
   price: 30,
   quantity: 100,
   image: open("http://oqr2tkodq.bkt.clouddn.com/%E8%84%90%E6%A9%99.jpg")
   )

 Product.create!(title: "樱桃采摘",
   description: "绿色无污染，享受丰收喜悦",
   price: 100,
   quantity: 90,
   image: open("http://oqr2tkodq.bkt.clouddn.com/%E6%A8%B1%E6%A1%83%E9%87%87%E6%91%98.jpg")
   )

 Product.create!(title: "做饭阿姨",
   description: "熟悉各种家常菜，给你家的味道",
   price: 100,
   quantity: 80,
   image: open("http://oqr2tkodq.bkt.clouddn.com/%E9%98%BF%E5%A7%A8%E5%81%9A%E6%99%9A%E9%A5%AD.jpg")
   )

 Product.create!(title: "清洁阿姨",
   description: "打扫卫生多快好省，给你一个整洁的家",
   price: 100,
   quantity: 88,
   image: open("http://oqr2tkodq.bkt.clouddn.com/%E9%98%BF%E5%A7%A8%E6%89%93%E6%89%AB%E5%8D%AB%E7%94%9F.jpg")
   )
