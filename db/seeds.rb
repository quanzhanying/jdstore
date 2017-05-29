# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.

# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

#

# Examples:

#

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])

#   Character.create(name: 'Luke', movie: movies.first)

# Initialize Product

Product.create!(
  brand_id: 1,
  name: "HAY- J104单椅",
  description: "尺寸：宽57 x深47 x高73 /高高44.5厘米",
  price: 2020,
  stock: 5,
  image: open("https://ws4.sinaimg.cn/large/006tKfTcgy1ffug7u3qq1j30b40gomxq.jpg"),
  category_id: 1,
  can_sell: true
  )

Product.create!(
  brand_id: 1,
  name: "HAY- Slit圆型几何边几",
  description: "尺寸：直径45 x高35.5厘米",
  price: 1795,
  stock: 5,
  image: open("https://ws1.sinaimg.cn/large/006tKfTcgy1ffug88zz8qj30m80eu3z3.jpg"),
  category_id: 2,
  can_sell: true
  )

Product.create!(
  brand_id: 1,
  name: "HAY- Revolver旋转吧台椅",
  description: "高型：直径34×高76厘米",
  price: 2020,
  stock: 5,
  image: open("https://ws4.sinaimg.cn/large/006tKfTcgy1ffug8g1srej30m80et0tl.jpg"),
  category_id: 3,
  can_sell: true
  )

Product.create!(
  brand_id: 1,
  name: "HAY- Can双人沙发",
  description: "尺寸：宽173 x深90 x高82 /座高40厘米",
  price: 16895,
  stock: 5,
  image: open("https://ws2.sinaimg.cn/large/006tKfTcgy1ffug8o7gltj30m80eujsv.jpg"),
  category_id: 4,
  can_sell: true
  )

Product.create!(
  brand_id: 2,
  name: "GUBI- Beetle休闲椅",
  description: "尺寸：宽72 x深63 x高82 /座高36厘米",
  price: 13450,
  stock: 5,
  image: open("https://ws1.sinaimg.cn/large/006tKfTcgy1ffug8zwccdj30ci0gogm0.jpg"),
  category_id: 1,
  can_sell: true
  )

Product.create!(
  brand_id: 2,
  name: "GUBI- MG Kangourou 咖啡桌",
  description: "小桌：直径18 x高40厘米
  大桌：40 x 48 x高39厘米",
  price: 4450,
  stock: 5,
  image: open("https://ws2.sinaimg.cn/large/006tKfTcgy1ffug97f5kvj30bo0goq34.jpg"),
  category_id: 2,
  can_sell: true
  )

Product.create!(
  brand_id: 2,
  name: "GUBI- MG Nagasaki 吧台椅",
  description: "尺寸：34 x 39 x高74厘米/坐高72厘米",
  price: 4125,
  stock: 5,
  image: open("https://ws3.sinaimg.cn/large/006tKfTcgy1ffug9g55qbj30bj0go0sy.jpg"),
  category_id: 3,
  can_sell: true
  )

Product.create!(
  brand_id: 3,
  name: "MENU- Afteroom午后椅",
  description: "尺寸：宽43 x深54 x高77 /坐高46厘米",
  price: 4250,
  stock: 5,
  image: open("https://ws3.sinaimg.cn/large/006tKfTcgy1ffug9q8z40j30ci0btglv.jpg"),
  category_id: 1,
  can_sell: true
  )

Product.create!(

  brand_id: 3,

  name: "MENU- Fuwl Cage边几",

  description: "尺寸：宽43 x深43 x高30厘米",

  price: 2700,

  stock: 5,

  image: open("https://ws4.sinaimg.cn/large/006tKfTcgy1ffugbfsausj30m80euaaw.jpg"),

  category_id: 2,
  can_sell: true
  )

Product.create!(

  brand_id: 4,

  name: "muuto- Nerd Chair",

  description: "宽45厘米x高79厘米x深50厘米",

  price: 5700,

  stock: 5,

  image: open("https://ws4.sinaimg.cn/large/006tKfTcgy1ffugbrqtq2j30m80goab4.jpg"),

  category_id: 1,
  can_sell: true
  )

Product.create!(

  brand_id: 4,

  name: "muuto- Nerd Bar Stool",

  description: "尺寸：宽45 x深46 x高89厘米，高75厘米",

  price: 6450,

  stock: 5,

  image: open("https://ws2.sinaimg.cn/large/006tKfTcgy1ffugc1uw71j30fx0goab3.jpg"),

  category_id: 3,
  can_sell: true
  )

Product.create!(

  brand_id: 4,

  name: "muuto- Oslo Three Seater Sofa",

  description: "尺寸：宽200x高78x深73

  座高：45厘米",

  price: 43000,

  stock: 5,

  image: open("https://ws1.sinaimg.cn/large/006tKfTcgy1ffugceazrsj30f20cq75a.jpg"),

  category_id: 4,
  can_sell: true
  )

Product.create!(

  brand_id: 5,

  name: "STUA- GAS 旋轉椅",

  description: "尺寸：寬57 x 深57 x 高78.5/座高44.5 cm",

  price: 6200,

  stock: 5,

  image: open("https://ws2.sinaimg.cn/large/006tKfTcgy1ffugcmit59j30m80ettbf.jpg"),

  category_id: 1,
  can_sell: true
  )

Product.create!(

  brand_id: 5,

  name: "STUA- Onda 吧台椅",

  description: "75吧台椅：宽41 x深38 x高93 /座高 75厘米",

  price: 3950,

  stock: 5,

  image: open("https://ws2.sinaimg.cn/large/006tKfTcgy1ffugcxl8vdj30m80etgoa.jpg"),

  category_id: 3,
  can_sell: true
  )

Product.create!(

  brand_id: 5,

  name: "STUA- Malena 單座沙发",

  description: "尺寸：寬63 x 深76 x 高73/座高43 cm",

  price: 14125,

  stock: 5,

  image: open("https://ws4.sinaimg.cn/large/006tKfTcgy1ffugd6h2nrj30m80etjv3.jpg"),

  category_id: 4,
  can_sell: true
  )

Product.create!(

  brand_id: 6,

  name: "ferm living- Herman Lounge Chair - Black",

  description: "尺寸：W：68×H：68×D：60cm",

  price: 4500,

  stock: 5,

  image: open("https://ws1.sinaimg.cn/large/006tKfTcgy1ffugdfvofvj30b80c7407.jpg"),

  category_id: 1,
  can_sell: true
  )

Product.create!(

  brand_id: 6,

  name: "ferm living- Herman Stool ",

  description: "尺寸：W：35.5cm，H：43cm，D：30.5cm",

  price: 1200,

  stock: 5,

  image: open("https://ws2.sinaimg.cn/large/006tKfTcgy1ffugdq0w1aj30ab0avjsp.jpg"),

  category_id: 3,
  can_sell: true
  )

Product.create!(

  brand_id: 6,

  name: "ferm living- Turn Sofa 2",

  description: "尺寸：W：160×H：73×D：71cm",

  price: 16000,

  stock: 5,

  image: open("https://ws1.sinaimg.cn/large/006tKfTcgy1ffuge0fdx2j30ci0an3za.jpg"),

  category_id: 4,
  can_sell: true
  )
