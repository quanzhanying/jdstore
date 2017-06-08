# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.new
u.email = "admin@test.com"           # 可以改成自己的 email

u.password = "123456"                # 最少要六码

u.password_confirmation = "123456"   # 最少要六码

u.is_admin = true
u.save

# Initialize Product
Category.create!(
  name:"无麸快餐"
)
Category.create!(
  name:"防弹咖啡套装"
)
Category.create!(
  name:"低霉菌咖啡"
)
Category.create!(
  name:"天然油脂"
)
Category.create!(
  name:"咖啡器具"
)
Product.create!(title: "澳洲羊排素材沙拉",
  description: "每天限量供应",
  price: 56,
  quantity: 100,
  category_id: 1,
  image: File.open(File.join(Rails.root, "/app/public/images/野兽yangpai.jpg"))
  )
Product.create!(title: "烟熏三文鱼",
description: "每天限量供应",
price: 56,
quantity: 100,
category_id: 1,
image: File.open(File.join(Rails.root, "/app/public/images/野兽烟熏三文鱼.jpg"))
)
Product.create!(title: "新西兰黑椒牛排",
description: "每天限量供应",
price: 56,
quantity: 100,
category_id: 1,
image: File.open(File.join(Rails.root, "/app/public/images/野兽新西兰黑椒牛排.jpg"))

)

Product.create!(title: "野兽生活 防弹咖啡 中度烘焙 低霉菌咖啡豆227g2袋 生酮饮食 包邮",
description: "防弹咖啡专用，极低霉菌度咖啡豆，多重精选，帮助你随时保持最佳状态。",
price: 380,
quantity: 100,
category_id: 2,
image: File.open(File.join(Rails.root, "/app/public/images/防弹咖啡套装2.jpg"))

)

Product.create!(title: "防弹咖啡必备套装 野兽生活咖啡豆227g椰子油450ml黄油2块 包邮",
description: "  ",
price: 369,
quantity: 100,
category_id: 2,
image: File.open(File.join(Rails.root, "/app/public/images/野兽防弹套装.jpg"))

)

Product.create!(title: "防弹咖啡 六合一制作套装 手冲器具 生酮减脂 野兽生活 全国包邮",
description: "来自硅谷的超级创新饮品，野兽防弹咖啡套装，破解体重问题的终极解决方案。",
price: 899,
quantity: 100,
category_id: 2,
image: File.open(File.join(Rails.root, "/app/public/images/野兽防弹咖啡六合一套装.jpg"))

)

Product.create!(title: "野兽生活 防弹咖啡 中度烘焙 低霉菌咖啡豆227g2袋 生酮饮食 包邮",
description: "防弹咖啡专用，极低霉菌度咖啡豆，多重精选，帮助你随时保持最佳状态。",
price: 380,
quantity: 100,
category_id: 3,
image: File.open(File.join(Rails.root, "/app/public/images/单包咖啡.jpg"))

)

Product.create!(title: "防弹咖啡专用 金凯利草饲无盐黄油爱尔兰200g1块 野兽生活包邮",
description: " ",
price: 36,
quantity: 100,
category_id: 4,
image: File.open(File.join(Rails.root, "/app/public/images/野兽无盐黄油.jpg"))

)

Product.create!(title: "防弹咖啡专用 泰国进口椰子油 gre3n天然初榨冷压 生酮 野兽生活
",
description: "富含中链脂肪酸MCT，帮助生酮，制作防弹咖啡专用，瞬间唤醒全天能量。",
price: 168,
quantity: 100,
category_id: 4,
image: File.open(File.join(Rails.root, "/app/public/images/野兽进口椰子油.jpg"))

)

Product.create!(title: "防弹咖啡 HARIO磨豆机 手动手摇 日本原装进口 野兽生活
",
description: "日本品牌 品质保障 陶瓷磨芯 手动磨豆机 研磨机。",
price: 188,
quantity: 100,
category_id: 5,
image: File.open(File.join(Rails.root, "/app/public/images/野兽咖啡研磨机.jpg"))

)

Product.create!(title: "泰摩小黑3.0法压壶 防弹咖啡冲泡家用小型350ml 野兽生活包邮
",
description: "3.0升级版",
price: 69,
quantity: 100,
category_id: 5,
image: File.open(File.join(Rails.root, "/app/public/images/野兽咖啡杯.jpg"))

)

Product.create!(title: "野兽生活 防弹咖啡 OSTER/奥士达 BLSTPB-WGN-073 搅拌机家用自动
",
  description: "",
  price: 299,
  quantity: 100,
  category_id: 5,
  image: File.open(File.join(Rails.root, "/app/public/images/野兽咖啡机.jpg"))
)
