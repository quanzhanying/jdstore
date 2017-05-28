if User.find_by(email: "122380981@qq.com").nil?
  u = User.new
  u.email = "122380981@qq.com"           # 可以改成自己的 email
  u.password = "111111"                # 最少要六码
  u.password_confirmation = "111111"   # 最少要六码
  u.is_admin = true
  
  u.save
  puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
else
  puts "Admin 已经建立过了，脚本跳过该步骤。"
end
  f_title = [
    "北京烤鸭",
    "大闸蟹",
    "东坡肉",
    "剁椒鱼头",
    "法式鸡公煲",
    "宫保鸡丁",
    "锅包肉",
    "过桥米线",
    "煎饼果子",
    "麻辣香锅",
    "墨西哥肉卷",
    "三明治",
    "三文鱼扒 ",
    "水煮鱼",
    "小笼包",
    "红烧肉"
  ]

    for i in 0..15 do
      Product.create!(
      title: f_title[i],
      description:"这只是底料，请去实验室DIY！",
      quantity:rand(6..10),
      price:rand(50..100)*10,
      # image: open(f_images[i])
      # product_id:[i],avatar:open(f_images[i])
      )
    end
