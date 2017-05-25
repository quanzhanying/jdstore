# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Initialize Admin User
if User.find_by(email: "admin@test.com").nil?
  u = User.new
  u.name = "admin"
  u.email = "admin@test.com"            # 可以改成自己的 email
  u.password = "123456"                 # 最少6位密码
  u.password_confirmation = "123456"    # 重复确认密码
  u.is_admin = true
  u.save
  puts "admin 已经建立好了，账号为：#{u.email}，密码为：#{u.password}"
else
  puts "admin 已经建立过了，脚本跳过该步骤。"
end

# User.create!(name: 'admin', email: 'admin@test.com', password: '123456', password_confirmation: '123456', is_admin: true)

# Initialize Product

# img_url: "小图", #图片不大，设置与img1一致
# img1_url: "图片1",
# img2_url: "图片2",
# img3_url: "图片3",
# img4_url: "图片4",
# img5_url: "图片5"

# 模板(水果)
# Product.create!(
#   name: "",
#   category: "生鲜",
#   category1: "水果",
#   category2: "",
#   location: "",
#   keyword: "新鲜水果",
#   content: "",
#   description: "",
#   remark: "",
#   price: ,
#   price_unit: "元/kg",
#   quantity: 99,
#   img_url: "",
#   img1_url: "",
#   img2_url: "",
#   img3_url: "",
#   img4_url: "",
#   img5_url: ""
# )

Product.create!(
  name: "山东烟台大红灯樱桃",
  category: "生鲜",
  category1: "水果",
  category2: "樱桃",
  location: "中国山东烟台",
  keyword: "新鲜水果 热销 特价 真实",
  content: "空运包邮 75元/3斤,115元/5斤",
  description: "山东烟台福山大樱桃/国产车厘子 空运包邮 75元/3斤,115元/5斤",
  remark: "",
  price: 75,
  price_unit: "元/1500g",
  quantity: 99,
  img_url: "https://img12.360buyimg.com/n1/jfs/t5323/320/1833168229/308109/79fec709/59152633N0aa5ca6a.jpg",
  img1_url: "https://img12.360buyimg.com/n1/jfs/t5323/320/1833168229/308109/79fec709/59152633N0aa5ca6a.jpg",
  img2_url: "https://img12.360buyimg.com/n1/jfs/t5461/185/1856867770/177694/80d3b757/591552dbN2f017669.jpg",
  img3_url: "https://img12.360buyimg.com/n1/jfs/t5725/161/72240003/232695/df6b7794/591552dfN11cd5b5c.jpg",
  img4_url: "https://img12.360buyimg.com/n1/jfs/t5434/350/1850291405/239627/1a8f5c0a/591552e5N7992bf14.jpg",
  img5_url: "https://img12.360buyimg.com/n1/jfs/t5116/334/1872815160/212367/7d1a0236/591552e9N7f7984e8.jpg"
)

Product.create!(
  name: "陕西金太阳大黄杏",
  category: "生鲜",
  category1: "水果",
  category2: "黄杏",
  location: "中国陕西",
  keyword: "新鲜水果 热销 特价 真实",
  content: "产地直供 5斤装 包邮",
  description: "陕西金太阳大黄杏 产地直供 新鲜直达 5斤装 包邮",
  remark: "",
  price: 30,
  price_unit: "元/2500kg",
  quantity: 99,
  img_url: "https://img13.360buyimg.com/n1/jfs/t4627/270/4477855988/44019/1dda4bd1/590eda3cN5cfdfe12.jpg",
  img1_url: "https://img13.360buyimg.com/n1/jfs/t4627/270/4477855988/44019/1dda4bd1/590eda3cN5cfdfe12.jpg",
  img2_url: "https://img13.360buyimg.com/n1/jfs/t4666/245/4428215607/44744/e18be1d8/590eda40Ndacecdf2.jpg",
  img3_url: "https://img13.360buyimg.com/n1/jfs/t5284/3/1309051973/441722/bfe5a270/590eda3dNf38368fd.jpg",
  img4_url: "https://img13.360buyimg.com/n1/jfs/t5185/90/1325526424/263401/f9c69aa0/590eda40Ne822d265.jpg",
  img5_url: "https://img13.360buyimg.com/n1/jfs/t4519/340/4430542878/406423/8e696bdc/590eda3fNc46b59b8.jpg"
)

Product.create!(
  name: "缅甸圣德龙芒果",
  category: "生鲜",
  category1: "水果",
  category2: "芒果",
  location: "缅甸进口",
  keyword: "新鲜水果 热销 特价 真实",
  content: "产地直供 8斤装 包邮",
  description: "缅甸圣德龙芒果 产地直供 新鲜直达 8斤装 包邮",
  remark: "",
  price: 38,
  price_unit: "元/4kg",
  quantity: 99,
  img_url: "https://img10.360buyimg.com/n1/jfs/t5170/87/348432264/215033/e3b0ad82/58fdb63cN8c12faf7.jpg",
  img1_url: "https://img10.360buyimg.com/n1/jfs/t5170/87/348432264/215033/e3b0ad82/58fdb63cN8c12faf7.jpg",
  img2_url: "https://img10.360buyimg.com/n1/jfs/t5467/116/166737481/69124/b770b91c/58f9cbe3Nf9367deb.jpg",
  img3_url: "https://img10.360buyimg.com/n1/jfs/t5095/157/162722884/270771/38b3e833/58f9cbe1Nc7c697fb.jpg",
  img4_url: "https://img10.360buyimg.com/n1/jfs/t4978/231/2151638415/260790/efd9f48a/58f9cbe0N41a2f6ed.jpg",
  img5_url: "https://img13.360buyimg.com/n1/jfs/t5473/40/1364739094/575202/301fb997/590fcec7Nba8ee26f.jpg"
)

Product.create!(
  name: "山东玉菇甜瓜/香瓜/蜜瓜",
  category: "生鲜",
  category1: "水果",
  category2: "甜瓜 香瓜 蜜瓜",
  location: "中国山东",
  keyword: "新鲜水果 热销 特价 真实",
  content: "产地直供 5斤装 包邮",
  description: "山东玉菇甜瓜/香瓜/蜜瓜 产地直供 新鲜直达 5斤装 包邮",
  remark: "",
  price: 30,
  price_unit: "元/2500kg",
  quantity: 99,
  img_url: "https://img13.360buyimg.com/n1/jfs/t4567/107/4182910770/98843/a1775314/590af444Nb2fd8560.jpg",
  img1_url: "https://img13.360buyimg.com/n1/jfs/t4567/107/4182910770/98843/a1775314/590af444Nb2fd8560.jpg",
  img2_url: "https://img13.360buyimg.com/n1/jfs/t2962/116/324840945/84177/17c809b9/5754e6afN94196bb1.jpg",
  img3_url: "https://img13.360buyimg.com/n1/jfs/t2893/306/2040559237/60574/4d412b98/5754e6b0Nbf158a3c.jpg",
  img4_url: "https://img13.360buyimg.com/n1/jfs/t5539/13/1078916671/90220/447676ab/590af45cNb126b71e.jpg",
  img5_url: "https://img13.360buyimg.com/n1/jfs/t5488/48/1075896449/93154/d50f735d/590af475Nd8c4fd40.jpg"
)

Product.create!(
  name: "越南进口红心火龙果",
  category: "生鲜",
  category1: "水果",
  category2: "火龙果",
  location: "越南进口",
  keyword: "新鲜水果",
  content: "3个装总重约1kg",
  description: "越南进口红心火龙果 3个装总重约1kg 新鲜水果",
  remark: "",
  price: 28.90,
  price_unit: "元/kg",
  quantity: 99,
  img_url: "https://img14.360buyimg.com/n0/jfs/t3046/265/544746786/200600/37296076/57baa5beNc13e05df.jpg",
  img1_url: "https://img14.360buyimg.com/n0/jfs/t3046/265/544746786/200600/37296076/57baa5beNc13e05df.jpg",
  img2_url: "https://img14.360buyimg.com/n0/jfs/t2998/363/973228004/202761/4bfcd19e/57baa5c2N756fc860.jpg",
  img3_url: "https://img14.360buyimg.com/n0/jfs/t3244/239/575055254/170785/c5d77019/57baa5c8N60e5ce21.jpg",
  img4_url: "https://img14.360buyimg.com/n0/jfs/t3232/52/553119387/171556/21ac860e/57baa5ccNadfedbd8.jpg",
  img5_url: "https://img14.360buyimg.com/n0/jfs/t3232/69/539717695/176729/cf1ff3d8/57baa5d1N901ffea5.jpg"
)

Product.create!(
  name: "广西百香果西番莲",
  category: "生鲜",
  category1: "水果",
  category2: "百香果",
  location: "中国广西",
  keyword: "新鲜水果",
  content: "12个装 单果50-80g",
  description: "百香果西番莲 12个装 单果50-80g 新鲜水果",
  remark: "",
  price: 23.90,
  price_unit: "元/kg",
  quantity: 99,
  img_url: "https://img14.360buyimg.com/n0/jfs/t4249/299/1787013554/1398162/765fb60/58c74838N1e6366c5.jpg",
  img1_url: "https://img14.360buyimg.com/n0/jfs/t4249/299/1787013554/1398162/765fb60/58c74838N1e6366c5.jpg",
  img2_url: "https://img14.360buyimg.com/n0/jfs/t4054/125/1203749445/115884/564fb57c/586e1a88N34dfb3f1.jpg",
  img3_url: "https://img14.360buyimg.com/n0/jfs/t3856/270/1218056140/82032/5973cb0a/586e1a8eNb1951461.jpg",
  img4_url: "https://img14.360buyimg.com/n0/jfs/t4018/109/1242121182/134482/d0c43765/586e1a93N3f7d3e72.jpg",
  img5_url: "https://img14.360buyimg.com/n0/jfs/t3280/66/5253985624/109297/3fc87853/586e1a98Na43dab7c.jpg"
)

Product.create!(
  name: "泰国进口椰青",
  category: "生鲜",
  category1: "水果",
  category2: "椰青",
  location: "泰国进口",
  keyword: "新鲜水果",
  content: "2个装 单果约750g",
  description: "展卉 泰国进口椰青 2个装 单果约750g 赠送开椰器和吸管 新鲜水果",
  remark: "",
  price: 26.9,
  price_unit: "元/750g",
  quantity: 99,
  img_url: "https://img14.360buyimg.com/n1/jfs/t5191/70/21987339/5469447/886f3fe6/58f7221aNfa9fee72.jpg",
  img1_url: "https://img14.360buyimg.com/n1/jfs/t5191/70/21987339/5469447/886f3fe6/58f7221aNfa9fee72.jpg",
  img2_url: "https://img14.360buyimg.com/n1/jfs/t5191/110/19496117/5437533/2e35d6a3/58f7222bN75fed314.jpg",
  img3_url: "https://img14.360buyimg.com/n1/jfs/t4825/37/1998437228/5450352/b4716dd8/58f7229eN1a8bb4ea.jpg",
  img4_url: "https://img14.360buyimg.com/n1/jfs/t5335/169/150188411/5485960/5a5886dd/58f9a7e3Na8733246.jpg",
  img5_url: "https://img14.360buyimg.com/n1/jfs/t4810/56/2148895312/5425091/756d0394/58f9a81aNc635ec72.jpg"
)

Product.create!(
  name: "泰国进口山竹",
  category: "生鲜",
  category1: "水果",
  category2: "山竹",
  location: "泰国进口",
  keyword: "新鲜水果",
  content: "1kg 简装",
  description: "",
  remark: "泰国进口山竹 1kg 新鲜水果",
  price: 42.90,
  price_unit: "元/kg",
  quantity: 99,
  img_url: "https://img14.360buyimg.com/n1/jfs/t3292/34/6444804940/1413933/db47129b/58a8f33eN4f425000.jpg",
  img1_url: "https://img14.360buyimg.com/n1/jfs/t3292/34/6444804940/1413933/db47129b/58a8f33eN4f425000.jpg",
  img2_url: "https://img14.360buyimg.com/n1/jfs/t3055/326/6612146979/1378615/d3e3b4a1/58a8f347Nbbe32290.jpg",
  img3_url: "https://img14.360buyimg.com/n1/jfs/t4072/179/2391145445/1389007/e2eaae53/58a8f34dN5e9e33e4.jpg",
  img4_url: "https://img14.360buyimg.com/n1/jfs/t3217/53/6633716909/1401120/127903e7/58a8f355N0ce7f7a2.jpg",
  img5_url: "https://img14.360buyimg.com/n1/jfs/t3292/84/6488317818/1359000/23e915b6/58a8f35cN2a94640d.jpg"
)


# Product.create!(
#   name: "山东烟露天红灯樱桃",
#   description: "Description 01",
#   price: 75,
#   quantity: 99,
#   img_url: "https://ws2.sinaimg.cn/large/006tKfTcgy1ffu5kdid1nj30i20hrgo2.jpg"
#   # image: open("https://ws2.sinaimg.cn/large/006tKfTcgy1ffu5kdid1nj30i20hrgo2.jpg")
# )
#
# Product.create!(
#   name: "陕西金太阳大黄杏",
#   description: "Description 02",
#   price: 30,
#   quantity: 99,
#   img_url: "https://ws1.sinaimg.cn/large/006tKfTcgy1ffu5y5eizej30ly0lln1e.jpg"
#   # image: open("https://ws1.sinaimg.cn/large/006tKfTcgy1ffu5y5eizej30ly0lln1e.jpg")
# )
#
# Product.create!(
#   name: "缅甸香芒",
#   description: "Description 03",
#   price: 38,
#   quantity: 99,
#   img_url: "https://ws1.sinaimg.cn/large/006tKfTcgy1ffu66id6c2j30ly0m1taw.jpg"
#   # image: open("https://ws1.sinaimg.cn/large/006tKfTcgy1ffu66id6c2j30ly0m1taw.jpg")
# )
#
# Product.create!(
#   name: "山东玉菇香瓜",
#   description: "Description 04",
#   price: 30,
#   quantity: 99,
#   img_url: "https://ws3.sinaimg.cn/large/006tKfTcgy1ffu6dpk0g0j30zk0zk7di.jpg"
#   # image: open("https://ws3.sinaimg.cn/large/006tKfTcgy1ffu6dpk0g0j30zk0zk7di.jpg")
# )


#下面兩個方法2選1

#方法1.先將照片上傳到iPic或其他位置，建議用這個方法
# Photo.create!(product_id:1,avatar: open('http://位置1.jpg'))
# Photo.create!(product_id:1,avatar: open('http://位置2.jpg'))

#方法2.照片在本地，先把照片放在 /app/assets/images/products 裡面一起推到heroku
#但git push heroku完要馬上跑seed.否則圖會被heroku刪除
# Photo.create!(product_id:1,avatar: open(File.join(Rails.root, "/app/assets/images/products/1-1.jpg")))
# Photo.create!(product_id:1,avatar: open(File.join(Rails.root, "/app/assets/images/products/1-2.jpg")))
