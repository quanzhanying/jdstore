# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.new
u.email = "admin@gmail.com"
u.password = "123456"
u.password_confirmation = "123456"
u.is_admin = true
u.save

puts "1 admin account created."

# Products
jujia = ["全棉针织条纹四件套 新款", "可水洗舒柔丝羽绒枕", "日式记忆绵坐垫", "北欧风珊瑚绒多功能暖脚套", "简日挂钟", "大头风扇"]
canchu = ["白色斜磨陶瓷刀", "懒人抹布", "日式酸枣木碗", "10双装 实木筷", "伸缩杆懒人拖把
", "恒温可调节电热水壶"]
peijian = ["轻简四季居家拖鞋", "20寸登机箱", "丝薄AB面羊毛围巾", "优雅格纹羊毛拖鞋", "牛皮信封手拿包", "牛皮休闲针扣皮带"]
fuzhuang = ["男式丝滑莫代尔平角内裤", "女式丝滑莫代尔三角内裤", "5双装 雅灰男式全毛圈隐形袜", "5双装 柔逸女式全毛圈隐形袜", "男式跃动休闲服套装", "女式棉绒撞色家居服套装"]
xihu = ["2条装 皇室御用超柔毛巾", "面包树的糖香氛喷雾", "墨玉 日常妆容化妆套刷", "声波深层洁面仪", "匠心天然黑檀木梳", "起泡海绵皂盒"]
yingtong = []
yinshi = []
zahuo = []
qita = []

# Product descriptions
jujia_description = ["裸睡享受，柔软透气有弹性", "柔软舒适深睡眠", "活性炭记忆绵，缓解压力", "时尚舒适", "清晰读数，极简素雅", "轻便静音，舒爽劲风"]
canchu_description = ["锋利耐用", "轻松去除污渍", "轻便", "易清洗", "无须清洗，直接替换", "英国进口strix温控器，延时煮沸3-6秒"]
peijian_description = ["人体工学设计，柔软舒适", "一年保修，30天保退", "羊毛的温暖，丝薄的质感", "羊毛质地，暖心冬日", "经典配饰，时尚点睛", "经典极简，精湛工艺"]
fuzhuang_description = ["奥地利兰精莫代尔", "奥地利兰精莫代尔", "全毛圈隐形袜，保暖有风范", "柔软轻盈，保暖好穿", "慢跑运动搭档，外穿居家两用", "100%全棉起绒布，古巴领&滚边"]
xihu_description = ["至柔至软", "小南山的椰奶甜味", "精致五刷，打造日常气质底妆", "2款定制刷头，声波温和去污", "稀有名木，东非黑檀", "吸水，透气，速干"]
yingtong_description = []
yinshi_description = []
zahuo_description = []
qita_description = []

# Product prices
jujia_prices = [299, 59, 59, 59, 89, 119]
canchu_prices = [89, 13.99, 39, 25, 39, 269]
peijian_prices = [19.9, 349, 99, 39, 199, 229]
fuzhuang_prices = [59, 49, 59, 49, 209, 199]
xihu_prices = [59, 79, 119, 299, 179, 15]
yingtong_prices = []
yinshi_prices = []
zahuo_prices = []
qita_prices = []

# Product categories
products_categories = ["居家", "餐厨", "配件", "服装", "洗护", "婴童", "饮食", "杂货", "其他"]

# Product images
jujia_images = ["public/images/bed.png", "public/images/pillow.png", "public/images/sitting.png", "public/images/foot.png", "public/images/guazhong.png", "public/images/fengshan.png"]
canchu_images = ["public/images/knife.png", "public/images/duster.png", "public/images/bowl.png", "public/images/chopsticks.png", "public/images/tuoba.png", "public/images/shuihu.png"]
peijian_images = ["public/images/tuoxie.png", "public/images/xiangzi.png", "public/images/weijin.png", "public/images/tuoxie2.png", "public/images/bao.png", "public/images/pidai.png"]
fuzhuang_images = ["public/images/nanneiku.png", "public/images/nvneiku.png", "public/images/nanwa.png", "public/images/nvwa.png", "public/images/nanyi.png", "public/images/nvyi.png"]
xihu_images = ["public/images/maojin.png", "public/images/penwu.png", "public/images/huazhuangshua.png", "public/images/jiemianyi.png", "public/images/mushua.png", "public/images/feizaohe.png"]
yingtong_images = []
yinshi_images = []
zahuo_images = []
qita_images = []

# Creating products
create_jujia = for i in 1..6 do
  Product.create!([title: jujia[i - 1], description: jujia_description[i - 1], quantity: rand(0..10), price: jujia_prices[i - 1], image: File.open(File.join(Rails.root, jujia_images[i - 1])), categories: products_categories[0]])
end
puts "6 jujia products created."

create_canchu = for i in 1..6 do
  Product.create!([title: canchu[i - 1], description: canchu_description[i - 1], quantity: rand(0..2), price: canchu_prices[i - 1], image: File.open(File.join(Rails.root, canchu_images[i - 1])), categories: products_categories[1]])
end
puts "6 canchu products created."

create_peijian = for i in 1..6 do
  Product.create!([title: peijian[i - 1], description: peijian_description[i - 1], quantity: rand(0..2), price: peijian_prices[i - 1], image: File.open(File.join(Rails.root, peijian_images[i - 1])), categories: products_categories[2]])
end
puts "6 peijian products created."

create_fuzhuang = for i in 1..6 do
  Product.create!([title: fuzhuang[i - 1], description: fuzhuang_description[i - 1], quantity: rand(0..2), price: fuzhuang_prices[i - 1], image: File.open(File.join(Rails.root, fuzhuang_images[i - 1])), categories: products_categories[3]])
end
puts "6 fuzhuang products created."

create_xihu = for i in 1..6 do
  Product.create!([title: xihu[i - 1], description: xihu_description[i - 1], quantity: rand(0..2), price: xihu_prices[i - 1], image: File.open(File.join(Rails.root, xihu_images[i - 1])), categories: products_categories[4]])
end
puts "6 xihu products created."
