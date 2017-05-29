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

Product.create!(
  title: '阿尔法·罗密欧 PANDION ',
  description: '作为一辆梦幻般的跑车，Pandion仍然保留了阿尔法罗密欧品牌的传统特征，并加入了新的设计元素。这款概念车也是为了庆祝阿尔法·罗密欧公司成立100周年而设计。头部采用中世纪骑士头盔的样式，车门灵感来自鱼鹰的翅膀，以后轮轴为中心向上垂直90°开启。尾部看似杂乱却造就了一种破壳而出的感觉，交错的刀刃表现出慧尾的姿态，使Pandion在静止时仍能保持足够的动感。',
  price: 2_178_000,
  quantity: 5,
  image: open('http://ww1.sinaimg.cn/large/006tKfTcgy1ffvcf7gca1j30sc0e7130.jpg')
)

Product.create!(
  title: '别克Riviera',
  description: '全新Riviera别克‘未来’概念车不仅在设计上，对别克‘动感流畅’的设计DNA予以大跨度的拓展，将前瞻科技、人性化功能与现代美学相融合，更对BIP别克智能驾乘体系未来技术进行了大胆创想，完美体现‘欧美科技创新体验’战略规划的同时，昭示了全球别克产品的未来发展方向。',
  price: 872_000,
  quantity: 6,
  image: open('http://ww2.sinaimg.cn/large/006tKfTcgy1ffvchrqzf7j30sg0lcjxh.jpg')
)

Product.create!(
  title: '阿斯顿·马丁CC1',
  description: '阿斯顿·马丁CC100概念车的设计灵感来自于1959年推出的经典的DBR1赛车，DBR1曾在勒芒拉力赛获得过优异的成绩，同时其经典的双座造型引领了一代设计风潮。采用碳纤维的车身结构，修长的车头看上去动感十足，同时该车还没有设计前风挡玻璃，车身上的100标识是向阿斯顿·马丁成立100周年献礼。',
  price: 1_960_000,
  quantity: 10,
  image: open('http://ww3.sinaimg.cn/large/006tKfTcgy1ffvcjlqnlmj30sg0lc460.jpg')
)

Product.create!(title: '坚果Pro',
                description: '手机',
                price: 1799,
                quantity: 8,
                image: open('https://ws1.sinaimg.cn/large/006tNbRwgy1fg2ftgnwzdj30m80m87cp.jpg'))

Product.create!(title: '大疆（DJI） 精灵3 标准版',
                description: '无人机',
                price: 2969,
                quantity: 10,
                image: open('https://ws4.sinaimg.cn/large/006tNbRwgy1fg2fu068i8j30m80m8q5k.jpg'))

Product.create!(title: 'MacBook Pro',
                description: 'Apple电脑',
                price: 14_888,
                quantity: 5,
                image: open('https://ws3.sinaimg.cn/large/006tNbRwgy1fg2fstpmgyj30m80jh40j.jpg'))
