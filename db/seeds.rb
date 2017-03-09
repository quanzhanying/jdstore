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

puts "管理员账号建立，aa@aa.aa,123456789"

create_jos =

Product.create!([
  title: "捐助动物基金会",
  description: "别说话，我们知道你来了，做你该做的就好了",
  quantity: 1000,
  price: 50,
  animal: "normal",
  is_hidden: 'true'
  ])

Product.create!([
  title: "大脸猴子",
  description: "可爱的大脸猴子，产自中国，非常非常非常非常非常可爱~~",
  zhonglei: "宠物",
  quantity: 1,
  price: 20000,
  ])

Product.create!([
  title: "大脸猴子的媳妇",
  description: "大脸猴子的媳妇，同样产自中国，非常非常非常凶悍！！！",
  zhonglei: "宠物",
  quantity: 1,
  price: 2,
  animal: "turtle"
  ])

Product.create!([
  title: "藏羚羊",
  description: "藏羚羊不是大熊猫。它是一种优势动物。只要你看到它们成群结队在雪后初霁的地平线上涌出，精灵一般的身材，优美得飞翔一样的跑姿，你就会相信，它能够在这片土地上生存数千万年，是因为它就是属于这里的。它不是一种自身濒临灭绝、适应能力差的动物，只要你不去管它，它自己就能活得好好的。",
  zhonglei: "美食，药材，皮草",
  quantity: 0,
  price: 20000,
  ])

Product.create!([
  title: "穿山甲",
  description: "穿山甲只是只遇到危险便紧紧缩成一个球的小动物它们不善于逃跑也正是因为这点才成为了全球捕杀最多的生物之一",
  zhonglei: "药材，美食",
  quantity: 0,
  price: 20000,
  ])

Product.create!([
  title: " 大象 ",
  description: "无论是在马戏团、 动物园，还是在印度教寺庙和儿童故事书中，千百年来大象令多少观众着迷。可悲的是，几个世纪以来，为了满足世界对象牙的需求，这种全世界最大的陆地哺乳动物常常被杀戮。",
  zhonglei: " shechipin ",
  quantity: 0,
  price: 20000,
  ])

Product.create!([
  title: "的的喀喀湖水蛙",
  description: " 别看这“的的喀喀”名字叫的可爱，其实长得“黏黏糊糊”。这种水蛙长期呆在水里，通过一层又一层的皮肤呼吸。据说，它可以使男性变得更Man，所以许多的的喀喀湖水蛙都被捕捉走做了盘中餐。 ",
  zhonglei: "美食，宠物",
  quantity: 0,
  price: 20000,
  ])

Product.create!([
  title: "鳄鱼",
  description: " 鳄鱼是迄今发现活着的最早和最原始的爬行动物，它是在三叠纪至白垩纪的中生代（ 约两亿年以前）由两栖类进化而来，延续至今仍是半水生性凶猛的爬行动物，它和恐龙是同时代的动物，恐龙的灭绝不管是环境的影响，还是自身的原因，都已是化石；鳄鱼的存在证明了它生命的强有力。可是现在... ",
  zhonglei: "奢侈品，皮草",
  quantity: 0,
  price: 20000,
  ])

Product.create!([
  title: "海豹",
  description: "  每年，加拿大东海岸的冰面都会染上斑斑血迹，数以万计的小海豹在冰面上被残忍地猎杀，海豹皮被出售制成奢侈品。",
  zhonglei: "皮草",
  quantity: 0,
  price: 20000,
  ])

Product.create!([
  title: "海獭",
  description: " 还有什么比海獭更能打动人呢？毛茸茸的小爪子、好奇的小表情，再加上滑稽的动作，相信第一眼看到海獭就足以让你欲罢不能。虽然人们在这种海洋哺乳动物身上已经投入了不少关注和财力，但它们的生存境况依然堪忧。 ",
  zhonglei: "picao",
  quantity: 0,
  price: 20000,
  ])

Product.create!([
  title: " 猎豹 ",
  description: " 这个地球陆地上奔跑速度最快的动物，现在却急速走在了濒临灭绝的道路上。如果人类不加以重视，“豹的速度”也许将成为渡渡鸟一样的传说。 ",
  zhonglei: "皮草",
  quantity: 0,
  price: 20000,
  ])

Product.create!([
  title: "美西钝口螈",
  description: " 在古代的时候这货还被称做龙崽，应为其外形酷似古代人们想象中的幼龙模样而得来的，其是在现在很多年轻人将其作为宠物的一种饲养起来，并非是真正的龙崽。将它视为龙崽可能是当时人们的一种美好的愿景，不可否认的是它确实很萌。很难想象是怀着怎样的心情去吃这么萌的一个小东西的呢？ ",
  zhonglei: "美食",
  quantity: 0,
  price: 20000,
  ])

Product.create!([
  title: "抹香鲸",
  description: " 正是因为龙诞香的珍贵，一些不法商贩盯上了抹香鲸，抹香鲸现在已经成为了濒危保护动物，然而这种龙诞香需经过海水的长时间浸泡才会达到药材的效果，那种直接猎杀抹香鲸得到的龙诞香没有任何作用 ",
  zhonglei: "药材，美食",
  quantity: 0,
  price: 20000,
  ])

Product.create!([
  title: "水滴鱼",
  description: " 水滴鱼，又名忧伤鱼或软隐棘杜父鱼、波波鱼，由于长着一副哭丧脸，被称为“全世界表情最忧伤”的鱼。这种海底怪鱼确实有理由郁闷：科学家警告称，由于深海捕捞作业，水滴鱼正遭受灭绝的威胁。 ",
  zhonglei: "宠物",
  quantity: 0,
  price: 20000,
  ])

Product.create!([
  title: "榛睡鼠",
  description: " 所谓“过街老鼠人人喊打”，但有这么一种老鼠过街没人喊打，反正会人见人爱。这就是英国的重点保护濒危动物榛睡鼠。榛睡鼠唯一的爱好就是睡觉，也许这就是它名字的来由。它的体形细小（身长 6 到 9 厘米），披着一身金棕色的毛，一双棕色大眼睛，一条毛茸茸的大尾巴（长 5.7 到 7.5 厘）米。~好小好萌！！ ",
  zhonglei: "宠物",
  quantity: 0,
  price: 20000,
  ])

Product.create!([
  title: "紫蛙",
  description: " 这种蛙属于生活在远古恐龙时期的一种特殊蛙类的分支种类。紫蛙之所以2003年才在印度发现，是因为它们生活于地下，只会在雨季的时候现身两周，其它时间一直过着隐身的生活。 ",
  zhonglei: "宠物",
  quantity: 0,
  price: 20000,
  ])








puts "商品生成"
