# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([Product.create!( name: 'Star Wars' }, Product.create!( name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Initialize Admin User
if User.find_by(email: "admin@test.com").nil?
  u = User.new
  u.email = "admin@test.com"           # 可以改成自己的 email
  u.password = "123456"                # 最少要六码
  u.password_confirmation = "123456"   # 最少要六码
  u.is_admin = true
  u.save
  puts "Admin 已经建立好了，帐号为#Product.create!(u.email}, 密码为#Product.create!(u.password}"
else
  puts "Admin 已经建立过了，脚本跳过该步骤。"
end


#分类建立
Category.create!(name: '精装手绘画')
Category.create!(name: '手绘酒瓶')
Category.create!(name: '手绘石头')

# Initialize Product
# product1
Product.create!(
title: '秋千',
description: '儿时的回忆',
quantity: '1',
price: '160',
category_id: '1',
image: open("http://twelvemoons.com.cn/wp-content/uploads/2015/12/TI006360.jpg"))

# product2
Product.create!(
title: '安睡',
description: '静静的熟睡',
quantity: '3',
price: '150',
category_id: '1',
image: open("http://twelvemoons.com.cn/wp-content/uploads/2015/12/TI001360.jpg"))

# product3
Product.create!(
title: '骏马',
description: '美女与骏马',
quantity: '2', price: '150',category_id: '1',
image: open("http://twelvemoons.com.cn/wp-content/uploads/2015/12/TI002360.jpg"))

# product4
Product.create!(
title: '小溪',
description: '在溪水中唱歌',
quantity: '1',
price: '160',category_id: '1',
image: open("http://twelvemoons.com.cn/wp-content/uploads/2015/12/TI003360.jpg"))

# product5
Product.create!(
  title: '花香',
  description: '沉浸在花香中',
  quantity: '1',
  price: '160',category_id: '1',
  image: open("http://twelvemoons.com.cn/wp-content/uploads/2015/12/TI004360.jpg"))

# product6
  Product.create!(
  title: '作画',
  description: '大自然中尽情作画',
  quantity: '2',
  price: '260',category_id: '1',
  image: open("http://twelvemoons.com.cn/wp-content/uploads/2015/12/TI005360.jpg"))

# product7
Product.create!(
title: "梦中甘露",
description: "哲-Tititi作 品，Posted in 作品集, 张王哲。",
author: "哲-Tititi",
price: "480",
quantity: "1",category_id: '1',
image: open("http://twelvemoons.com.cn/wp-content/uploads/2015/12/TI003.jpg"))

# product8
  Product.create!(
  title: '狐狸',
  description: '与兔子在森林中嬉戏',
  quantity: '1',
  price: '160',category_id: '1',
  image: open("http://twelvemoons.com.cn/wp-content/uploads/2015/12/TI011.jpg"))

# product9

Product.create!(
title: "手绘酒瓶-执子子手",
description: "TWELVE MOONS 团队手绘酒瓶--执子之手，以酒瓶作画布，采用多种颜料绘制，只此一件。",
author: "TWELVE MOONS 团队",
price: "2600",
quantity: "1",category_id: '1',
image: open("http://twelvemoons.com.cn/wp-content/uploads/2014/04/%E6%89%A7%E5%AD%90%E4%B9%8B%E6%89%8B717.jpg"))

Product.create!(
title: "小风琴折页本",
description: "封面封底为哲-Tititi的原创插画作品；全特种纸风琴折内页，竖条纹肌理；使用前和使用后都会保持整体平整；内页可以用水彩及多种画材绘画。",
author: "哲-Tititi",
price: "68",
quantity: "10",category_id: '1',
image: open("https://gd4.alicdn.com/imgextra/i3/1791335855/TB2Y3d1ipXXXXbUXpXXXXXXXXXX_!!1791335855.jpg"))

Product.create!(
title: "孔雀羽毛",
description: "纯手绘创意油画，从笔法到色彩都是和市场行画有着天蓝之别。厚实的肌理效果，明细的凹凸创意油画的特性",
author: "意辉",
price: "680",
quantity: "1",category_id: '1',
image: open("http://upload.art.ifeng.com/2016/0506/thumb_1076_500_1462527261785.jpg"))

Product.create!(
title: "五彩手繪敦煌禮佛圖鐘鼓瓶",
description: "瓶高：39CM  瓶宽：33CM  敦煌礼佛图钟鼓瓶数位敦煌佛女，手托礼盘，衣带飘飞，神态各异。有的双腿盘坐，托腮冥思、有的静望礼盘，神情专注、有的凝眸四望，顾盼生姿……让观者仿若置身敦煌，沐浴佛音。具有极高的鉴赏价值及艺术收藏价值。",
author: "肖躍青大師",
price: "38800",
quantity: "1",category_id: '1',
image: open("https://img.alicdn.com/imgextra/i3/1109693099/TB2yYKea4vzQeBjSZFMXXcVfFXa_!!1109693099.jpg"))
