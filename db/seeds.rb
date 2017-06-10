# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# u = User.new
# u.email = "admin@gmail.com"
# u.password = "123456"
# u.password_confirmation = "123456"
# u.is_admin = true
# u.save

# initalize Admin user

if User.find_by(email: "admin@gmail.com").nil?
  u = User.new
  u.email = "admin@gmail.com"
  u.password = "123456"
  u.password_confirmation = "123456"
  u.is_admin = true
  u.save
  puts "Admin 已经创建，账号为#{u.email}, 密码为#{u.password}"
else
  puts "Admin 已经创建过了，脚本跳过此步骤"
end


# initalize product
#
Product.create!(title: "YAMAHA 雅马哈 FG800民谣吉他(原木色)",
description: "全新的FG800系列吉他带来您从未聆听过的FG吉他音色，与以往一样出色的演奏手感以及一直以来引以为豪的制作水平为万千吉他爱好者提供了一个新的选择。无论你的音乐之旅将去往何方，它将从这里开始。全新开发的音梁结构新型音梁结构在保障面板耐用性的同时带来了全新的声音。",
price: 1590,
quantity: 1000,
image: MiniMagick::Image.open("https://images-cn.ssl-images-amazon.com/images/I/41aNNvTaa5L._AC_UL160_SR160,160_.jpg")
)

Product.create!(title: "YAMAHA 雅马哈 FGX830C 单板缺角电箱民谣木吉他",
description: "FGX830C面板为单板云杉木，背侧使用玫瑰木。该产品在琴码下装载了压电拾音单元配合System66拾音系统保障其在舞台上发挥佳性能。",
price: 3190,
quantity: 1000,
image: MiniMagick::Image.open("https://images-cn.ssl-images-amazon.com/images/I/41bVSMLUllL._AC_UL320_SR320,320_.jpg")
)

Product.create!(title: "Roland 罗兰 数码钢琴 RP301-SB 黑色 印尼原装进口",
description: "它內建節拍器、錄音器以及Twin Piano雙鋼琴機能，SuperNATURAL超真實鋼琴音色傳遞不可思議的真實音色與響應，象牙質感G型鍵盤雅致而細膩。讓您以經濟的價格享受如平台鋼琴般的彈奏享受!",
price: 5780,
quantity: 1000,
image: MiniMagick::Image.open("https://images-cn.ssl-images-amazon.com/images/I/41RQkjMArIL._AC_SR300,300_.jpg")
)

Product.create!(title: "ROLAND罗兰智能电子鼓 (TD11K（网状军鼓）)",
description: "PDX-8 10寸，网面双触发，净重21.5kg,底鼓KD-9，鼓架MDS-4V",
price: 10350,
quantity: 1000,
image: MiniMagick::Image.open("https://images-cn.ssl-images-amazon.com/images/I/41V7jaxiSGL._AA160_.jpg")
)


Product.create!(title: "YAMAHA 雅马哈 TRBX305 电贝司 苹果红 Yamaha 雅马哈",
description: "TRBX设有一个雕刻实心桃花心木琴身，色调和舒适性之间的平衡再加上完美的重量分配与质量优化的3D设计。TRBX的颈部设计结合了一个快速，超舒适的轮廓与出色的稳定性和出色的音5件枫木/红木层压建设。38毫米（4弦）螺母宽度提供快捷，舒适的可玩性任何风格。",
price: 3400,
quantity: 1000,
image: MiniMagick::Image.open("https://images-cn.ssl-images-amazon.com/images/I/31loLsCKAzL._AC_SR300,300_.jpg")
)

Product.create!(title: "Marshall马歇尔 Stanmore M-ACCS-00164 Stanmore音箱 黑色",
description: "Marshall马歇尔Stanmore音箱体积小巧，却拥有强大的音频性能，可以无线播放iPhone、iPad、iPod touch上的音乐，带来一如既往的大舞台效果。Stanmore的经典设计将你带回摇滚的黄金时代，模拟交互旋钮让你自己控制音乐。这款音箱的复古装饰、铜质细节和标志性的文字标志与家中其它的Marshall马歇尔产品完美融合。用蓝牙进行无线连接，用RCA输入接入播放器，用附带的连接线还能将iOS设备接入3.5毫米aux端口。Stanmore还兼容Apple电视等拥有光学输出的设备。",
price: 2050,
quantity: 1000,
image: MiniMagick::Image.open("https://images-cn.ssl-images-amazon.com/images/I/51Z8WTr9TtL._AA160_.jpg"))


Product.create!(title: "JBL LSR308 Studio Monitor音箱",
description: "JBL 的 LSR308 有源音箱是预算有限的工作室的好选择。您将拥有清亮广域的声音享受，环绕着不可思议的立体声，非常适合混合音乐、编辑视频制作或任何其他多媒体任务。LSR308 令人惊叹的超大声秘密是 JBL 的 Image Control Waveguide 技术，可以使音箱获得额外维度的效果，同等价位的其它音箱无法达到这样的效果。如果您需要最佳的监听解决方案，那么 JBL LSR308 会是您的好选择。",
price: 1724,
quantity: 1000,
image: MiniMagick::Image.open("https://images-cn.ssl-images-amazon.com/images/I/41SE4cSbSSL._AA160_.jpg"))

Product.create!(title: "YAMAHA 雅马哈 UR12 USB声卡 音频接口",
description: "2进2出的UR12，可在面板上切换直接监听（Direct Monitor），并为用户提供基于硬件的输入零延迟，无论是与Cubase还是与其他音乐制作软件进行连接都能带给您专业〜的录音体验。UR12具有D-PRE话放，可直接连接电吉他和贝斯的Hi-Z输入，以及为家庭录音和移动录音设置的两路线路输出。同时支持PC和Mac系统，可与iPad进行连接。",
price: 908,
quantity: 1000,
image: MiniMagick::Image.open("https://images-cn.ssl-images-amazon.com/images/I/41VnU6zlRKL._AA160_.jpg"))

Product.create!(title: "Evans G2 12 寸喷砂鼓皮 B12G2",
description: "Evans G2 喷砂系列是目前市场上受欢迎的鼓皮之一，每一张鼓皮均由双层 7 密耳油皮构成，具有很高的一致性和耐用性。完美融合音色、余音以及打击三大元素，既能让小通鼓音色清脆，也能让地通鼓音色低沉。喷砂版鼓皮的音色更加温暖、集中、低沉，半透明外观十分独特。",
price: 129,
quantity: 1000,
image: MiniMagick::Image.open("https://images-cn.ssl-images-amazon.com/images/I/41MdP1dmmwL._AA160_.jpg"))

Product.create!(title: "TOMBO通宝复音口琴NO.6624 TOMBO HOPE SUPER24 G调",
description: "TOMBO HARMONICA--hope复音系列产品是TOMBO公司专门针对广大中国口琴爱好者设计和制作的，它秉承了日本TOMBO口琴的全部优点；音簧座板和盖板采用镶嵌式设计，琴格全部采用食品级ABS树脂为原料，发音灵敏、音律准确、波动均匀，外观设计也充分考虑了使用多支口琴演奏时倒换的灵活性。特别需要指出的是：它采用了从日本进口的、制作工艺精湛的音簧，不仅保持力极强，而且无论吹奏时气流强弱，都会发出美妙独特的TOMBO口琴的音色。",
price: 198,
quantity: 1000,
image: MiniMagick::Image.open("https://images-cn.ssl-images-amazon.com/images/I/31lUvbTeWkL._AA160_.jpg"))

Product.create!(title: "YAMAHA 雅马哈 ARIUS系列YDP-143R电钢琴88键数码钢琴(含配套琴架 三踏板及琴凳) 深玫瑰木色",
description: "真实的声音，自然的触感，充满享受的演奏，融入了先进技术的高性价比数码钢琴。
迷人的木质厢式设计和雅马哈传奇的钢琴制造工艺造就了数码钢琴的优良品质。",
price: 5699,
quantity: 1000,
image: MiniMagick::Image.open("https://images-cn.ssl-images-amazon.com/images/I/41Xp5dxOc%2BL._AC_UL160_SR160,160_.jpg"))

Product.create!(title: "梦响MOZA VNK80 演奏独奏小提琴 国际大师监制虎纹纯手工小提琴",
description: "随琴配置琴盒、琴弓、进口琴弦2套，FOM肩托，电子调音器，弱音器，松香，鹿皮绒琴布——已配齐，无需另购配件。默认安装一个微调，再另配三个微调，需要发货前把四个微调都装上的亲请下单后邮件说明或致电说明，也可收到货后请老师安装微调。",
price: 2800,
quantity: 1000,
image: MiniMagick::Image.open("https://images-cn.ssl-images-amazon.com/images/I/41WdORGah0L._AA160_.jpg"))

# Product.create!(title: "",
# description: "",
# price: ,
# quantity: 1000,
# image: MiniMagick::Image.open(""))
#
# Product.create!(title: "",
# description: "",
# price: ,
# quantity: 1000,
# image: MiniMagick::Image.open(""))
#MiniMagick::Image.
