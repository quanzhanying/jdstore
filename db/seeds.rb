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

# Initialize Category

Category.create!(
  name: "新鲜果蔬"
)

Category.create!(
  name: "肉类蛋禽"
)

Category.create!(
  name: "五谷粮油"
)

Category.create!(
  name: "干货零食"
)

Category.create!(
  name: "茶水饮品"
)

Category.create!(
  name: "礼品礼盒"
)

# Initialize Product
# img_url: "小图", #图片不大，设置与img1一致
# img1_url: "图片1",
# img2_url: "图片2",
# img3_url: "图片3",
# img4_url: "图片4",
# img5_url: "图片5"

##############################################

Product.create!(
  name: "山东烟台美早大樱桃",
  category_id: 1,
  category: "全部商品",
  category1: "新鲜果蔬",
  category2: "水果",
  category3: "樱桃",
  location: "中国山东烟台",
  keyword: "新鲜水果 热销 特价 真实",
  content: "空运包邮 110元/3斤,165元/5斤",
  description: "红唇之吻 烟台美早大樱桃 26mm-28mm大果 1.5kg，2.5kg装 顺丰包邮 75元/3斤，115元/5斤",
  remark: "",
  price: 110,
  price_unit: "元/1500g",
  quantity: 99,
  img_url: "https://img14.360buyimg.com/n0/jfs/t5689/165/2227775223/214124/16e6ad82/592ea0beN2b1dea2c.jpg",
  img1_url: "https://img14.360buyimg.com/n0/jfs/t5689/165/2227775223/214124/16e6ad82/592ea0beN2b1dea2c.jpg",
  img2_url: "https://img14.360buyimg.com/n0/jfs/t5470/137/1872799043/108422/9a259472/59158d41Ned1e0416.jpg",
  img3_url: "https://img10.360buyimg.com/n1/jfs/t5146/228/1856113288/67077/36a2ac16/59158d42N87de736c.jpg",
  img4_url: "https://img10.360buyimg.com/n1/jfs/t5611/328/94890673/182444/8de58170/59158d42Nb6285b70.jpg",
  img5_url: "https://img10.360buyimg.com/n1/jfs/t5464/135/1874657785/177639/26062a69/59158d42N33b22a4c.jpg"
)

Product.create!(
  name: "广西百香果西番莲",
  category_id: 1,
  category: "全部商品",
  category1: "新鲜果蔬",
  category2: "水果",
  category3: "百香果",
  location: "中国广西",
  keyword: "新鲜水果 热销 特价 真实",
  content: "包邮 45元/5斤",
  description: "百香果5斤包邮广西鸡蛋果新鲜水果红果当季大果百香果西番莲现摘 大果2.5kg 约5斤",
  remark: "",
  price: 45,
  price_unit: "元/2500g",
  quantity: 99,
  img_url: "https://img14.360buyimg.com/n1/jfs/t5746/3/1203595309/979729/9aa62eee/59244394Na2faf6ec.png",
  img1_url: "https://img14.360buyimg.com/n1/jfs/t5746/3/1203595309/979729/9aa62eee/59244394Na2faf6ec.png",
  img2_url: "https://img14.360buyimg.com/n1/jfs/t5584/342/1226184648/161808/41c73b9f/5924439fN2b9844c7.jpg",
  img3_url: "https://img14.360buyimg.com/n1/jfs/t5581/116/1210489485/210570/58377869/592443a0N5bff8872.jpg",
  img4_url: "https://img14.360buyimg.com/n1/jfs/t5653/177/1191502815/171555/ef4e90c7/592443a1Nc5349101.jpg",
  img5_url: "https://img14.360buyimg.com/n1/jfs/t5650/332/1165351606/454591/86c5b019/592443a2N26406bfe.jpg"
)

Product.create!(
  name: "广西火龙果",
  category_id: 1,
  category: "全部商品",
  category1: "新鲜果蔬",
  category2: "水果",
  category3: "火龙果",
  location: "中国广西",
  keyword: "新鲜水果 热销 特价 真实 预售",
  content: "包邮 35.98元/5斤",
  description: "预售 火龙果 包邮 35.98元/5斤",
  remark: "",
  price: 35.98,
  price_unit: "元/2500g",
  quantity: 99,
  img_url: "https://img14.360buyimg.com/n1/jfs/t3046/265/544746786/200600/37296076/57baa5beNc13e05df.jpg",
  img1_url: "https://img14.360buyimg.com/n1/jfs/t3046/265/544746786/200600/37296076/57baa5beNc13e05df.jpg",
  img2_url: "https://img14.360buyimg.com/n1/jfs/t2998/363/973228004/202761/4bfcd19e/57baa5c2N756fc860.jpg",
  img3_url: "https://img14.360buyimg.com/n1/jfs/t3244/239/575055254/170785/c5d77019/57baa5c8N60e5ce21.jpg",
  img4_url: "https://img14.360buyimg.com/n1/jfs/t3232/52/553119387/171556/21ac860e/57baa5ccNadfedbd8.jpg",
  img5_url: "https://img14.360buyimg.com/n1/jfs/t3232/69/539717695/176729/cf1ff3d8/57baa5d1N901ffea5.jpg"
)

Product.create!(
  name: "广西贵妃芒",
  category_id: 1,
  category: "全部商品",
  category1: "新鲜果蔬",
  category2: "水果",
  category3: "贵妃芒",
  location: "中国广西",
  keyword: "新鲜水果 热销 特价 真实 现货",
  content: "包邮 39.8元/8斤",
  description: "广西贵妃芒 包邮 39.8元/8斤",
  remark: "",
  price: 39.8,
  price_unit: "元/2500g",
  quantity: 99,
  img_url: "https://img13.360buyimg.com/n1/s450x450_jfs/t4552/152/783638979/271221/8fac2f9a/58d4c059N5327b712.jpg",
  img1_url: "https://img13.360buyimg.com/n1/s450x450_jfs/t4552/152/783638979/271221/8fac2f9a/58d4c059N5327b712.jpg",
  img2_url: "https://img13.360buyimg.com/n1/s450x450_jfs/t3202/52/9585957568/343877/21839a73/58d4c060N92df0f40.jpg",
  img3_url: "https://img13.360buyimg.com/n1/s450x450_jfs/t4471/222/793531196/356189/96950b81/58d4c06dNb18d721c.jpg",
  img4_url: "https://img13.360buyimg.com/n1/s450x450_jfs/t4234/122/2675074289/310214/8e4def0b/58d4c075Nc4c7899f.jpg",
  img5_url: "https://img13.360buyimg.com/n1/s450x450_jfs/t4579/268/791992998/466304/30d72c56/58d4c07aN96e6008c.jpg"
)

Product.create!(
  name: "云南冰糖红心木瓜",
  category_id: 1,
  category: "全部商品",
  category1: "新鲜果蔬",
  category2: "水果",
  category3: "木瓜",
  location: "中国广西",
  keyword: "新鲜水果 热销 特价 真实 现货",
  content: "包邮 23.9元/8斤",
  description: "云南特产冰糖红心牛奶木瓜/青木瓜 产地直发 包邮 23.9元/8斤",
  remark: "",
  price: 23.9,
  price_unit: "元/2500g",
  quantity: 99,
  img_url: "https://img13.360buyimg.com/n1/jfs/t3289/105/8807398207/396229/f416e6bd/58ca2d40N053471b1.jpg",
  img1_url: "https://img13.360buyimg.com/n1/jfs/t3289/105/8807398207/396229/f416e6bd/58ca2d40N053471b1.jpg",
  img2_url: "https://img13.360buyimg.com/n1/jfs/t4231/140/19367233/375404/2d8f1c34/58ad92ebNf1483faf.jpg",
  img3_url: "https://img13.360buyimg.com/n1/jfs/t4378/149/20869897/264475/60b048e4/58ad92eeNaa37bafa.jpg",
  img4_url: "https://img13.360buyimg.com/n1/jfs/t4612/193/125357527/92528/4f624d76/58ca2d3cN4034e7b4.jpg",
  img5_url: "https://img13.360buyimg.com/n1/jfs/t4555/189/131246635/127765/6b2768da/58ca2d3eN6849f857.jpg"
)

Product.create!(
  name: "山东烟台大红灯樱桃",
  category_id: 1,
  category: "全部商品",
  category1: "新鲜果蔬",
  category2: "水果",
  category3: "樱桃",
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
  category_id: 1,
  category: "全部商品",
  category1: "新鲜果蔬",
  category2: "水果",
  category3: "黄杏",
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
  category_id: 1,
  category: "全部商品",
  category1: "新鲜果蔬",
  category2: "水果",
  category3: "芒果",
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
  category_id: 1,
  category: "全部商品",
  category1: "新鲜果蔬",
  category2: "水果",
  category3: "甜瓜 香瓜 蜜瓜",
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
  category_id: 1,
  category: "全部商品",
  category1: "新鲜果蔬",
  category2: "水果",
  category3: "火龙果",
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
  category_id: 1,
  category: "全部商品",
  category1: "新鲜果蔬",
  category2: "水果",
  category3: "百香果",
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
  category_id: 1,
  category: "全部商品",
  category1: "新鲜果蔬",
  category2: "水果",
  category3: "椰青",
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
  category_id: 1,
  category: "全部商品",
  category1: "新鲜果蔬",
  category2: "水果",
  category3: "山竹",
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

# ---------------------------------------------- #

Product.create!(
  name: "小油菜",
  category_id: 1,
  category: "全部商品",
  category1: "新鲜果蔬",
  category2: "蔬菜",
  category3: "小油菜",
  location: "中国北京",
  keyword: "",
  content: "约400g",
  description: "小油菜 约400g 新鲜蔬菜",
  remark: "",
  price: 7.9,
  price_unit: "元/400g",
  quantity: 99,
  img_url: "https://img14.360buyimg.com/n1/jfs/t4297/120/375562832/241785/c162c78b/58b3c779Na1ec50a0.jpg",
  img1_url: "https://img14.360buyimg.com/n1/jfs/t4297/120/375562832/241785/c162c78b/58b3c779Na1ec50a0.jpg",
  img2_url: "https://img14.360buyimg.com/n1/jfs/t3526/125/1983385612/102665/8f77dcf5/583aa053N7a853f98.jpg",
  img3_url: "https://img14.360buyimg.com/n1/jfs/t3532/144/1935108946/106039/c7463907/583aa059N896a9852.jpg",
  img4_url: "https://img14.360buyimg.com/n1/jfs/t3577/144/1924685625/173278/8842502/583aa05cNd3762e87.jpg",
  img5_url: "https://img14.360buyimg.com/n1/jfs/t4084/361/61477247/117741/e10093a2/583aa05fN22dcfab8.jpg"
)

Product.create!(
  name: "西兰花",
  category_id: 1,
  category: "全部商品",
  category1: "新鲜果蔬",
  category2: "蔬菜",
  category3: "西兰花",
  location: "中国北京",
  keyword: "",
  content: "约300g",
  description: "西兰花 约300g 新鲜蔬菜",
  remark: "",
  price: 8.8,
  price_unit: "元/300g",
  quantity: 99,
  img_url: "https://img13.360buyimg.com/n1/jfs/t3526/310/2014375487/500788/99978c40/583d31d0N4b3c83e0.jpg",
  img1_url: "https://img13.360buyimg.com/n1/jfs/t3526/310/2014375487/500788/99978c40/583d31d0N4b3c83e0.jpg",
  img2_url: "https://img13.360buyimg.com/n1/jfs/t3979/204/64149849/159095/ca5674a4/583a9721N4798e3bc.jpg",
  img3_url: "https://img13.360buyimg.com/n1/jfs/t3604/6/1990235018/103314/2563dcc6/583a971dNef4b5a63.jpg",
  img4_url: "https://img13.360buyimg.com/n1/jfs/t3106/134/4243076371/102319/398a1d26/583a9725Na33728f3.jpg",
  img5_url: "https://img13.360buyimg.com/n1/jfs/t3253/313/4272697987/77967/4d139380/583a9729N49f8244c.jpg"
)

Product.create!(
  name: "西红柿",
  category_id: 1,
  category: "全部商品",
  category1: "新鲜果蔬",
  category2: "蔬菜",
  category3: "西红柿",
  location: "中国北京",
  keyword: "",
  content: "约300g",
  description: "西红柿 约1100g 新鲜蔬菜",
  remark: "",
  price: 14.8,
  price_unit: "元/1100g",
  quantity: 99,
  img_url: "https://img13.360buyimg.com/n1/jfs/t4237/72/338884735/326271/fabe0f8d/58b3c666N4d3ff37e.jpg",
  img1_url: "https://img13.360buyimg.com/n1/jfs/t4237/72/338884735/326271/fabe0f8d/58b3c666N4d3ff37e.jpg",
  img2_url: "https://img13.360buyimg.com/n1/jfs/t3457/273/1892117287/100700/7958c17c/583a96ceN97a7032c.jpg",
  img3_url: "https://img13.360buyimg.com/n1/jfs/t3604/6/1990235018/103314/2563dcc6/583a971dNef4b5a63.jpg",
  img4_url: "https://img13.360buyimg.com/n1/jfs/t3670/288/1996603874/363349/65f0b4cf/583a96d8N3895a0d1.jpg",
  img5_url: "https://img13.360buyimg.com/n1/jfs/t3769/13/2004822490/278265/a3ca3ede/583a96dbN7c72024e.jpg"
)

Product.create!(
  name: "玉米",
  category_id: 1,
  category: "全部商品",
  category1: "新鲜果蔬",
  category2: "蔬菜",
  category3: "玉米",
  location: "中国云南玉溪",
  keyword: "",
  content: "约1000g",
  description: "玉米 约1000g 新鲜蔬菜",
  remark: "",
  price: 19.9,
  price_unit: "元/1000g",
  quantity: 99,
  img_url: "https://img13.360buyimg.com/n1/jfs/t4246/289/2634715009/258129/57262707/58d4d4a3Nc17334a0.jpg",
  img1_url: "https://img13.360buyimg.com/n1/jfs/t4246/289/2634715009/258129/57262707/58d4d4a3Nc17334a0.jpg",
  img2_url: "https://img13.360buyimg.com/n1/jfs/t4597/116/781049534/427715/3248dbbb/58d4d4aaN738cb50e.jpg",
  img3_url: "https://img13.360buyimg.com/n1/jfs/t3256/155/8985042448/386987/42f9ffa3/58d4d4adN50e4c5da.jpg",
  img4_url: "https://img13.360buyimg.com/n1/jfs/t4636/150/779913328/406706/5c28894a/58d4cd14Nfd6beb47.jpg",
  img5_url: "https://img13.360buyimg.com/n1/jfs/t4684/141/804199507/463121/78fc9c7e/58d4cd18N27437994.jpg"
)

# ---------------------------------------------- #

Product.create!(
  name: "澳洲家庭牛排套餐",
  category_id: 2,
  category: "全部商品",
  category1: "肉类蛋禽",
  category2: "牛羊猪",
  category3: "牛肉",
  location: "澳洲 进口",
  keyword: "",
  content: "约400g",
  description: "腌制系列 澳洲家庭牛排套餐 10单片 新鲜牛肉黑椒菲力西冷刀叉",
  remark: "",
  price: 108,
  price_unit: "元/1.6kg",
  quantity: 99,
  img_url: "https://img11.360buyimg.com/n1/jfs/t2446/19/2787779510/257805/1bf07374/571888c6N83029e68.jpg",
  img1_url: "https://img11.360buyimg.com/n1/jfs/t2446/19/2787779510/257805/1bf07374/571888c6N83029e68.jpg",
  img2_url: "https://img11.360buyimg.com/n1/jfs/t4690/85/2939616358/185983/4d1015c6/58f464dbNe42264c8.jpg",
  img3_url: "https://img11.360buyimg.com/n1/jfs/t4387/288/2879800343/268511/da856553/58f464e0Nf4cc7b07.jpg",
  img4_url: "https://img11.360buyimg.com/n1/jfs/t5074/100/1797000643/244289/ed6d475e/58f46550N3f7e7106.jpg",
  img5_url: "https://img11.360buyimg.com/n1/jfs/t4750/191/1774558285/299930/f47d2834/58f4654cN23494ff4.jpg"
)

Product.create!(
  name: "奥尔良烤翅免腌制",
  category_id: 2,
  category: "全部商品",
  category1: "肉类蛋禽",
  category2: "鸡鸭鹅",
  category3: "鸡肉 鸡翅",
  location: "中国浙江杭州市",
  keyword: "",
  content: "200g两对",
  description: "奥尔良烤翅免腌制200g两对",
  remark: "",
  price: 108,
  price_unit: "元/200g",
  quantity: 99,
  img_url: "https://img13.360buyimg.com/n1/jfs/t4975/89/1771973093/376398/d2ce4547/58f465beNe98736f9.jpg",
  img1_url: "https://img13.360buyimg.com/n1/jfs/t4975/89/1771973093/376398/d2ce4547/58f465beNe98736f9.jpg",
  img2_url: "https://img13.360buyimg.com/n1/jfs/t3199/317/2255042339/123191/a419a56a/57df5788N94a33fa7.jpg",
  img3_url: "https://img13.360buyimg.com/n5/jfs/t4495/71/2889630763/361665/3bd08bd1/58f465c0Nc6c62421.jpg",
  img4_url: "https://img13.360buyimg.com/n1/jfs/t3229/111/2276465149/96729/3e20ba93/57df57b1N486f12dd.jpg",
  img5_url: "https://img13.360buyimg.com/n1/jfs/t4441/227/2883509009/403664/649e5774/58f465c2N4802a354.jpg"
)

Product.create!(
  name: "大西洋冰鲜三文鱼腩刺身",
  category_id: 2,
  category: "全部商品",
  category1: "肉类蛋禽",
  category2: "鱼",
  category3: "三文鱼",
  location: "进口",
  keyword: "",
  content: "400g 袋装",
  description: "大西洋冰鲜三文鱼腩刺身 400g 袋装 海鲜水产",
  remark: "",
  price: 118,
  price_unit: "元/400g",
  quantity: 99,
  img_url: "https://img13.360buyimg.com/n1/jfs/t2734/206/124295504/183884/8e6232fd/5703d77aN38971990.jpg",
  img1_url: "https://img13.360buyimg.com/n1/jfs/t2734/206/124295504/183884/8e6232fd/5703d77aN38971990.jpg",
  img2_url: "https://img13.360buyimg.com/n1/jfs/t3136/249/8228157200/162512/f03edb1e/58c22592N7ad9e19f.jpg",
  img3_url: "https://img11.360buyimg.com/n1/jfs/t1846/340/1232417826/311157/3e57e4d1/564b78d6N99247f43.jpg",
  img4_url: "https://img13.360buyimg.com/n1/jfs/t3286/182/8483040083/180656/9f5d9288/58c22598N246b3c3b.jpg",
  img5_url: "https://img13.360buyimg.com/n1/jfs/t4129/48/1452381826/175786/927df76c/58c2259bN0d6ce866.jpg"
)

Product.create!(
  name: "洞庭湖咸蛋",
  category_id: 2,
  category: "全部商品",
  category1: "肉类蛋禽",
  category2: "蛋",
  category3: "咸蛋 咸鸭蛋",
  location: "进口",
  keyword: "",
  content: "20枚 1kg",
  description: "洞庭湖咸蛋 真空包装咸鸭蛋 20枚 1kg",
  remark: "",
  price: 118,
  price_unit: "元/400g",
  quantity: 99,
  img_url: "https://img11.360buyimg.com/n1/jfs/t3307/306/5572513062/178654/5c32f07/587af203N585e0505.jpg",
  img1_url: "https://img11.360buyimg.com/n1/jfs/t3307/306/5572513062/178654/5c32f07/587af203N585e0505.jpg",
  img2_url: "https://img11.360buyimg.com/n1/jfs/t3364/308/448368738/351118/206c65b6/5809bc55N30c13548.jpg",
  img3_url: "https://img11.360buyimg.com/n1/jfs/t3430/306/434704275/227125/8c4047ee/5809bc54N130e6486.jpg",
  img4_url: "https://img11.360buyimg.com/n1/jfs/t4003/233/1510761628/62049/c657c18a/587af21eNa25cf809.jpg",
  img5_url: "https://img11.360buyimg.com/n1/jfs/t3916/323/1473440519/79783/f9ae89c7/587af21eN09be1c7b.jpg"
)

# ---------------------------------------------- #

Product.create!(
  name: "东北五常生态稻花香大米",
  category_id: 3,
  category: "全部商品",
  category1: "粮油米面",
  category2: "米",
  category3: "大米",
  location: "中国 东北",
  keyword: "",
  content: "15斤 包邮",
  description: "东北五常生态稻花香大米 新米现磨 15斤 包邮",
  remark: "",
  price: 185,
  price_unit: "元/12.5kg",
  quantity: 99,
  img_url: "https://img11.360buyimg.com/n1/jfs/t3046/149/4860842224/962683/4ce8ca14/585b8360N26256228.jpg",
  img1_url: "https://img11.360buyimg.com/n1/jfs/t3046/149/4860842224/962683/4ce8ca14/585b8360N26256228.jpg",
  img2_url: "https://img11.360buyimg.com/n1/jfs/t3088/16/4986947252/928046/7c32afa/585b835aNd6ef4c49.jpg",
  img3_url: "https://img13.360buyimg.com/n1/jfs/t3835/198/2219284238/395042/7840cb1e/5853bf8aN77eaa559.jpg",
  img4_url: "https://img13.360buyimg.com/n1/jfs/t3997/301/124273683/223461/4051ff95/583e4fffNeb109f69.jpg",
  img5_url: "https://img13.360buyimg.com/n1/jfs/t3433/115/2045919669/252126/fb7cb5e7/583e5004N30ecaed4.jpg"
)

Product.create!(
  name: "东北杂粮大米精选十谷米",
  category_id: 3,
  category: "全部商品",
  category1: "粮油米面",
  category2: "米",
  category3: "大米 杂粮",
  location: "中国 东北",
  keyword: "",
  content: "400g",
  description: "东北杂粮大米精选十谷米 400g",
  remark: "",
  price: 14.8,
  price_unit: "元/400g",
  quantity: 99,
  img_url: "https://img13.360buyimg.com/n1/jfs/t4501/10/2558929760/118631/53ad0fbf/58f0987cNf84226d2.jpg",
  img1_url: "https://img13.360buyimg.com/n1/jfs/t4501/10/2558929760/118631/53ad0fbf/58f0987cNf84226d2.jpg",
  img2_url: "https://img13.360buyimg.com/n1/jfs/t4759/53/1459688475/1185986/d543cd87/58f0987dNca1b6c8c.jpg",
  img3_url: "https://img13.360buyimg.com/n1/jfs/t4699/74/2597020611/1238489/a5e4b41b/58f0987eN5ed5399a.jpg",
  img4_url: "https://img13.360buyimg.com/n1/jfs/t5047/164/1478452012/1201077/2c2dd812/58f0987fN4da8ec1b.jpg",
  img5_url: "https://img13.360buyimg.com/n1/jfs/t4627/90/2552916437/1608995/eb0320e1/58f09881N4c3f9667.jpg"
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
