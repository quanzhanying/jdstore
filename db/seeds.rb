# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

if User.find_by(email: 'admin@gmail.com').nil?
  u = User.new
  u.email = 'admin@gmail.com' # 可以改成自己的 email
  u.password = '123456'                # 最少要六码
  u.password_confirmation = '123456'   # 最少要六码
  u.is_admin = true
  u.save
  puts '新建管理员'
else
  puts '该账户已创建，不重复增加'
end

if User.find_by(email: 'user@gmail.com').nil?
  v = User.new
  v.email = 'user@gmail.com'           # 可以改成自己的 email
  v.password = '123456'                # 最少要六码
  v.password_confirmation = '123456'   # 最少要六码
  v.is_admin = false
  v.save
  puts '新建普通用户'
else
  puts '该账户已创建，不重复增加'
end

if User.find_by(email: 'cltatest@126.com').nil?
  u = User.new
  u.email = 'cltatest@126.com'           # 可以改成自己的 email
  u.password = '12345687'                # 最少要六码
  u.password_confirmation = '12345687'   # 最少要六码
  u.is_admin = true
  u.save
  puts '新建管理员'
else
  puts '该账户已创建，不重复增加'
end

#
#
# create_procucts = for i in 1..6 do
#   Product.create!(title: "经典著作#{i}", description: "这本书主要描述的是：這是作者的第 #{i} 本书", bookreview: '功能尚未实现，敬请期待', price: rand(19..59), quantity: rand(5..15), image: open('https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Melk_-_Abbey_-_Library.jpg/1200px-Melk_-_Abbey_-_Library.jpg'),)
# end
# puts "随机创建二十个测试数据."
#
#


if Product.find_by(title: '圣经').nil?
  Product.create!(title: '圣经',
                  description: 'The Holy Bible (King James Version)',
                  bookreview: '功能尚未实现，敬请期待', price: 119,
                  quantity: 5,
                  image: open('http://jgospel.net/media/123369/.jpg'),
                  )
  puts '新增产品'
else
  puts '该产品已创建，不重复增加'
end

if Product.find_by(title: '小王子').nil?
  Product.create!(title: '小王子',
                  description: '小王子（纯美珍藏绘本）',
                  bookreview: '功能尚未实现，敬请期待', price: 29,
                  quantity: 6,
                  image: open('https://img1.doubanio.com/lpic/s1237549.jpg'),
                  )
  puts '新增产品'
else
  puts '该产品已创建，不重复增加'
end

if Product.find_by(title: '人类群星闪耀时').nil?
  Product.create!(title: '人类群星闪耀时',
                  description: '茨威格从悠久的历史中撷取十四个重要时刻加以生动刻画，这些时刻——正如他在本书“序言”中所说——“对世世代代做出不可改变的决定；它决定着一个人的生死、决定着一个民族的存亡甚至整个人类的命运”。',
                  bookreview: '功能尚未实现，敬请期待', price: 36,
                  quantity: 10,
                  image: open('https://img3.doubanio.com/lpic/s28104752.jpg'),

                  )
  puts '新增产品'
else
  puts '该产品已创建，不重复增加'
end

if Product.find_by(title: '浪潮之巅').nil?
  Product.create!(title: '浪潮之巅',
                  description: '这不是一本科技产业发展历史集，而是在这个数字时代，一本IT人非读不可，而非IT人也应该拜读的作品。 ',
                  bookreview: '功能尚未实现，敬请期待', price: 99,
                  quantity: 8,
                  image: open('https://img3.doubanio.com/lpic/s27932441.jpg'),

                  )
  puts '新增产品'
else
  puts '该产品已创建，不重复增加'
end

if Product.find_by(title: '海边的卡夫卡').nil?
  Product.create!(title: '海边的卡夫卡',
                  description: '小说描写一个15岁少年立志成为世界上坚韧的人，离家踏上“不重复第二遍”的旅途，由此遇上一系列奇人奇事。',
                  bookreview: '功能尚未实现，敬请期待', price: 49,
                  quantity: 10,
                  image: open('http://pic.pimg.tw/lovetabris/1184031969.jpg'),

                  )
  puts '新增产品'
else
  puts '该产品已创建，不重复增加'
end

if Product.find_by(title: '无声告白').nil?
  Product.create!(title: '无声告白',
                  description: '我们终此一生，就是要摆脱他人的期待，找到真正的自己。',
                  bookreview: '功能尚未实现，敬请期待', price: 26,
                  quantity: 5,
                  image: open('https://img3.doubanio.com/lpic/s28109182.jpg'),

                  )
  puts '新增产品'
else
  puts '该产品已创建，不重复增加'
end


if Product.find_by(title: '對話伍迪艾倫').nil?
  Product.create!(title: '對話伍迪艾倫',
                  description: '我的電影永遠都會用來表達個人感受，無論是索然無味的人生或是恐怖的存在。',
                  bookreview: '功能尚未实现，敬请期待', price: 149,
                  quantity: 5,
                  image: open('https://img3.doubanio.com/lpic/s28343713.jpg'),

                  )
  puts '新增产品'
else
  puts '该产品已创建，不重复增加'
end

if Product.find_by(title: '木心1989-1994 文學回憶錄套書').nil?
  Product.create!(title: '木心1989-1994 文學回憶錄套書',
                  description: '《文學回憶錄》，從古代至二十世紀、從西方到東方，攏聚文學花果，是開啟世界文學之門的叩門磚，是航向世界文學的引路燈塔。',
                  bookreview: '功能尚未实现，敬请期待', price: 99,
                  quantity: 6,
                  image: open('https://img1.doubanio.com/lpic/s24611679.jpg'),

                  )
  puts '新增产品'
else
  puts '该产品已创建，不重复增加'
end


if Product.find_by(title: '长尾理论').nil?
  Product.create!(title: '长尾理论',
                  description: '书中阐述，商业和文化的未来不在于传统需求曲线上那个代表“畅销商品”（hits）的头部； 而是那条代表“冷门商品”（misses）经常为人遗忘的长尾。 举例来说， 一家大型书店通常可摆放10万本书，但亚马逊网络书店的图书销售额中，有四分之一来自排名10万以后的书籍。这些“冷门”书籍的销售比例正以高速成长，预估未来可占整体书市的一半。 ',
                  bookreview: '功能尚未实现，敬请期待', price: 77,
                  quantity: 8,
                  image: open('https://img3.doubanio.com/lpic/s1914890.jpg'),

                  )
  puts '新增产品'
else
  puts '该产品已创建，不重复增加'
end

if Product.find_by(title: '解忧杂货店').nil?
  Product.create!(title: '解忧杂货店',
                  description: '僻静的街道旁有一家杂货店，只要写下烦恼投进卷帘门的投信口，第二天就会在店后的牛奶箱里得到回答。',
                  bookreview: '功能尚未实现，敬请期待', price: 49,
                  quantity: 10,
                  image: open('https://img3.doubanio.com/lpic/s27264181.jpg'),

                  )
  puts '新增产品'
else
  puts '该产品已创建，不重复增加'
end

if Product.find_by(title: '未来简史').nil?
  Product.create!(title: '未来简史',
                  description: '进入21世纪后，曾经长期威胁人类生存、发展的瘟疫、饥荒和战争已经被攻克，智人面临着新的待办议题：永生不老、幸福快乐和成为具有“神性”的人类。在解决这些新问题的过程中，科学技术的发展将颠覆我们很多当下认为无需佐证的“常识”，比如人文主义所推崇的自由意志将面临严峻挑战，机器将会代替人类做出更明智的选择。
更重要的，当以大数据、人工智能为代表的科学技术发展的日益成熟，人类将面临着从进化到智人以来zui大的一次改变，绝大部分人将沦为“无价值的群体”，只有少部分人能进化成特质发生改变的 “神人”。
未来，人类将面临着三大问题：生物本身就是算法，生命是不断处理数据的过程；意识与智能的分离；拥有大数据积累的外部环境将比我们自己更了解自己。如何看待这三大问题，以及如何采取应对措施，将直接影响着人类未来的发展。',
                  bookreview: '功能尚未实现，敬请期待', price: 45,
                  quantity: 5,
                  image: open('https://img3.doubanio.com/lpic/s29287103.jpg'),

                  )
  puts '新增产品'
else
  puts '该产品已创建，不重复增加'
end


if Product.find_by(title: '上瘾').nil?
  Product.create!(title: '上瘾',
                  description: '让用户养成使用习惯的四大产品逻辑',
                  bookreview: '功能尚未实现，敬请期待', price: 45,
                  quantity: 5,
                  image: open('https://img1.doubanio.com/view/ark_article_cover/retina/public/34357709.jpg?v=1495531728.0')

                  )
  puts '新增产品'
else
  puts '该产品已创建，不重复增加'
end
