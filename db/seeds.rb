# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "create an admin account and a user account"
User.create!(email: "admin@test.com", password: "123456", password_confirmation: "123456", is_admin: true)
User.create!(email: "123@gmail.com", password: "123456", password_confirmation: "123456", is_admin: false)

# puts "chef info"
# chefs =[{name:"Bobby Flay", description:"钟爱厨艺，也喜爱品尝不同国家美食，足迹遍布多国，每年均会抽空到外地旅游和享受美酒佳肴，揣摩世界各地的厨艺和探索饮食潮流，随之融会贯通，创造出个人的烹饪风格。",
#   level:"一级厨师", style:"法式料理",image_path: "#{Rails.root}/app/assets/images/Bobby-Flay.jpg", is_hidden: true},
#   {name:"Matt Lambert", description:"钟爱厨艺，也喜爱品尝不同国家美食，足迹遍布多国，每年均会抽空到外地旅游和享受美酒佳肴，揣摩世界各地的厨艺和探索饮食潮流，随之融会贯通，创造出个人的烹饪风格。",
#     level:"一级厨师", style:"法式料理",image_path: "#{Rails.root}/app/assets/images/Bobby-Flay.jpg", is_hidden: true}
# ]

Chef.create!(name: "Matt Lambert",
description: "一以贯之。我觉得那最为关键，对我一直非常重要。假如你做什么，做到恰到好处。有句我喜欢的名言，‘假如你没时间将它做对，你何时有时间从头来过？’ 这是我认同的方式。好事必将随之而来。
关于食物的美好记忆
有个相当特别的记忆：我小时候，邻居时常出去垂钓，在后院，他将一台旧冰箱改成了烟熏器。他曾经烟熏了整条鱼，送给我们。我对此记忆深刻。", style: "意大利风味", chef_level_id: 1, city: "北京" )
Chef.create!(name: "Ian Purkayastha",
description: "我爱吃世界各地的风味特色菜，最爱吃的是意大利菜，比如意大利乳酪，通心粉，烩饭，腌肉等。会尝试把不同的食材混合在一起，享受不同食材间擦出火花的那一瞬间。
关于食物的美好记忆
初次尝到黑松露意式饺子配鹅肝酱汁，无疑是最美好的关于食物的记忆，这改变了我的人生。小时候与外公一起下厨也很难忘：煎虾，烤肉或是红烧肉炒饭。", style: "意大利风味", chef_level_id: 1, city: "上海" )
Chef.create!(name: "Alida Borgna",
description: "我从小想学厨艺。父亲说首先得先学会清理厨房，保养刀和厨具。大家都说大厨需要一把好刀，我觉得一个好锅子也有帮助。不过，我是在加州伯克利的chezPanisse实习时，才真正练出来一手刀功。作为一名实习生，每日清早第一件事，就是切好两大筐洋葱。几个月下来，熟极而流。跟厨艺有关的多数方面，直觉有帮助，但最终还是持续练习，才让你精进。在厨房工作，就必须得保证工作质量持续稳定，绝不能让顾客失望。
关于食物的美好回忆
这有些不好回答，因为我做的事多半与食物相关。也许最让我印象深刻的是夏天在撒丁岛午餐时吃到最完美的番茄，再像我祖父那样随手用叉子切开一片清凉西瓜。", style: "法国风味", chef_level_id: 1, city: "广州" )

Product.create!(title: "Nil（原商品已不存在)", description: "Nil", quantity: 0, price: 0, is_hidden: true)
Product.create!(title: "奶香果蔬焗小黄鱼", description: "选用深海的小黄鱼，配以四季豆、香橙，有黄油的奶香味和大蒜、橙子的混合香味，黄鱼肉香滑嫩，口齿留香。", quantity: 100, price: 100, style: "法国风味",  special: true)
Product.create!(title: "香煎波士顿龙虾", description: "选用进口波士顿龙虾，煎至上色，配以蔬菜沙拉及薯条，大虾色红，虾香浓郁，肉质甘甜Q弹，营养丰富。", quantity: 50, price: 800, style: "法国风味",  special: true)
Product.create!(title: "澳洲西冷牛排", description: "先用澳洲进口西冷牛排，秘制调料腌制，多汁细嫩，并有牛肉和黑椒混合的特有香气.香辣，奶香味浓郁。", quantity: 150, price: 60, style: "法国风味",  special: true)
Product.create!(title: "鲜蔬菜沙拉", description: "紫甘蓝、黄瓜、萝卜、核桃仁、芝士粉等，各种原料混合，配以油醋汁等，原汁原味，色泽鲜艳。", quantity: 60, price: 35, style: "意大利风味")
Product.create!(title: "香煎三文鱼", description: "选用现切新鲜三文鱼，配以上好的海盐和黑胡椒，淋上柠檬汁入味，平底锅煎至两面金黄，感受鱼肉最原始的鲜美。", quantity: 100, price: 120, style: "意大利风味",  special: true)
Product.create!(title: "海鲜饭", description: "选用智利青口贝，阿根廷红虾，澳洲鲜贝，西班牙chorizo腊肠，paella专用米，藏红花，佐以青豆、柠檬。每一粒米上都包裹着海鲜汁的自然鲜味，好吃到停不下来。", quantity: 100, price: 60, style: "综合",  special: true)
Product.create!(title: "南瓜时蔬奶香浓汤", description: "上好的日本迷你南瓜，搭配圣女果、彩椒、鲜奶油，入口细腻，南瓜的香味和鲜奶的香味洽到好处的融合，回味无穷。", quantity: 100, price: 58, style: "意大利风味")
Product.create!(title: "蜜汁烧鸡", description: "上好的鸡胸肉，配迷你圆白菜火腿丝，淋上厨师的蜜汁酱汁，蜜汁酱裹着鲜嫩的鸡肉，一口下去，这味道再也忘不了。", quantity: 100, price: 58, style: "南洋风味",  special: true)
