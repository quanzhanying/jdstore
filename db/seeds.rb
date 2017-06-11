# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Initialize Admin User
if User.find_by(email: "zhuqi@test.com").nil?
  u = User.new
  u.email = "zhuqi@test.com"           # 可以改成自己的 email
  u.name="zhuqi"
  u.password = "123456"                # 最少要六码
  u.password_confirmation = "123456"   # 最少要六码
  u.is_admin = true
  u.save
  puts "Admin1 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
else
  puts "Admin1 已经建立过了，脚本跳过该步骤."
end

if User.find_by(email: "bigkid@test.com").nil?
  u = User.new
  u.email = "bigkid@test.com"           # 可以改成自己的 email
    u.name="bigkid"
  u.password = "123456"                # 最少要六码
  u.password_confirmation = "123456"   # 最少要六码
  u.is_admin = true
  u.save
  puts "Admin2 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
else
  puts "Admin2 已经建立过了，脚本跳过该步骤."
end


# Initialize  Categorys

if Category.find_by(name: "旅行").nil?
Category.create!(
name: "旅行")
puts "成功建立1个类别：旅行"
else
  puts "类别：旅行 已经存在"
end



if Category.find_by(name: "大孩子").nil?
Category.create!(
name: "大孩子")
puts "成功建立1个类别：大孩子"
else
  puts "类别：大孩子 已经存在"
end

if Category.find_by(name: "中世纪").nil?
Category.create!(
name: "中世纪"
)
puts "成功建立1个类别：中世纪"
else
  puts "类别：中世纪 已经存在"
end


if Category.find_by(name: "厨具").nil?
Category.create!(
name: "厨具"
)
puts "成功建立1个类别：厨具"
else
  puts "类别：厨具 已经存在"
end


if Category.find_by(name: "公仔").nil?
Category.create!(
name: "公仔"
)
puts "成功建立1个类别：公仔"
else
  puts "类别：公仔 已经存在"
end

if Category.find_by(name: "木质").nil?
Category.create!(
name: "木质"
)
puts "成功建立1个类别：木质"
else
  puts "类别：木质 已经存在"
end


if Category.find_by(name: "植物").nil?
Category.create!(
name: "植物"
)
puts "成功建立1个类别：植物"
else
  puts "类别：植物 已经存在"
end


# Initialize  Products


# 旅行 类产品
## 旅行 1
# if Product.find_by(title: "鸵鸟睡枕").nil?
# Product.create!(
#  title: "鸵鸟睡枕",
#   description: "睡觉神器，让充电是小睡可以随时随地，无处不在。独特的仿生学设计，为您创建私人空间，放松身心，让您每天都精力充沛！",
#   price: 139,
#   quantity: 500,
#   category_id: 1,
#   image: open("https://ws2.sinaimg.cn/large/006tNc79ly1fg99e64uyfj30rl0rktdn.jpg"),
#   product_images_attributes: [
#     { image: open("https://images-na.ssl-images-amazon.com/images/I/71V9%2BhQs0WL._SL1500_.jpg") },
#     { image: open("https://images-na.ssl-images-amazon.com/images/I/61OUZyyvZSL._SL1100_.jpg")},
#     { image: open("https://images-na.ssl-images-amazon.com/images/I/717fbsl9PxL._SL1500_.jpg") },
#     { image: open("https://images-na.ssl-images-amazon.com/images/I/81uN1kCLROL._SL1255_.jpg") },
#     { image: open("https://ws4.sinaimg.cn/large/006tNc79ly1fg983i40anj30jq0f7jx9.jpg") }
#   ]
#   )
#   puts "成功建立1个商品：鸵鸟睡枕"
# else
#   puts "鸵鸟睡枕 已经存在"
# end

## 旅行 2
if Product.find_by(title: "B&O PLAY H5 无线蓝牙耳机").nil?
Product.create!(
 title: "B&O PLAY H5 无线蓝牙耳机",
  description: "沉浸式音效，无感佩戴，轻松舒适,无线连接，防水防尘，专为旅行外出设计。",
  price: 1612,
  quantity: 30,
  category_id: 1,
    particulars: " ",
  image: open("https://images-na.ssl-images-amazon.com/images/I/61v8404V-CL._SL1500_.jpg"),
  product_images_attributes: [
    { image: open("https://images-na.ssl-images-amazon.com/images/I/61v8404V-CL._SL1500_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/61TjaWuE3FL._SL1500_.jpg")},
    { image: open("https://images-na.ssl-images-amazon.com/images/I/512MTzLiMnL._SL1500_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/61b3EFuPIqL._SL1500_.jpg") }
  ],
  product_particular_images_attributes: [
    { image: open("https://images-na.ssl-images-amazon.com/images/I/7198UVCpBUL._SL1500_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/81azr%2BI6LPL._SL1500_.jpg")},
    { image: open("https://images-na.ssl-images-amazon.com/images/I/71U3glKmG8L._SL1500_.jpg") }
  ]
  )
  puts "成功建立1个商品：B&O PLAY H5 无线蓝牙耳机"
else
  puts "B&O PLAY H5 无线蓝牙耳机 已经存在"
end

## 旅行 3
if Product.find_by(title: "皱皱城市地图（巴黎）").nil?
Product.create!(
 title: "皱皱城市地图（巴黎）",
  description: "这款地图不怕皱，不怕风吹日晒，不怕折痕，看完了随意塞进口袋，需要了扯出来抖开，冷了当披肩，热了遮太阳，吸睛神器，旅行必备。",
  price: 66,
  quantity: 700,
  category_id: 1,
    particulars: " ",
  image: open("https://images-na.ssl-images-amazon.com/images/I/615zUsVzO3L.jpg"),
  product_images_attributes: [
    { image: open("https://images-na.ssl-images-amazon.com/images/I/615zUsVzO3L.jpg")},
    { image: open("https://images-na.ssl-images-amazon.com/images/I/81zaKflO0oL.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/81KisyCSfwL.jpg") }
  ],
  product_particular_images_attributes: [
    { image: open("https://images-na.ssl-images-amazon.com/images/I/81qRUkJc%2B9L.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/71I3h0Vv0WL.jpg")},
    { image: open("https://images-na.ssl-images-amazon.com/images/I/81zaKflO0oL.jpg") }
  ]

  )
  puts "成功建立1个商品：皱皱城市地图（巴黎）"
else
  puts "皱皱城市地图（巴黎） 已经存在"
end

## 旅行 4
if Product.find_by(title: "First Aid急救包").nil?
Product.create!(
 title: "First Aid急救包",
  description: "最小却又最有效的急救包，专为旅行，驾车，骑行设计。轻松装入行囊。FDA批准，符合最高医用安全标准。",
  price: 66,
  quantity: 700,
  category_id: 1,
  particulars: "",
  image: open("https://images-na.ssl-images-amazon.com/images/I/81rPRvb1X6L._SL1500_.jpg"),
  product_images_attributes: [
    { image: open("https://images-na.ssl-images-amazon.com/images/I/81rPRvb1X6L._SL1500_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/91tKrOkE9FL._SL1500_.jpg")},
    { image: open("https://images-na.ssl-images-amazon.com/images/I/81zJpQLAfBL._SL1500_.jpg") }
  ],
  product_particular_images_attributes: [
    { image: open("https://images-na.ssl-images-amazon.com/images/I/81PXWFKH%2BOL._SX522_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/81XKZKKY32L._SL1500_.jpg")}
  ]
  )
  puts "成功建立1个商品：First Aid急救包"
else
  puts "First Aid急救包 已经存在"
end



## 旅行 5
if Product.find_by(title: "blink眼罩").nil?
Product.create!(
 title: "blink眼罩",
  description: "全遮光设计，纯棉外层，柔软内芯，舒适佩戴，让飞机旅途不再疲劳。",
  price: 111,
  quantity: 180,
  category_id: 1,
    particulars: " ",
  image: open("https://images-na.ssl-images-amazon.com/images/I/51tOKq6TUNL._SL1001_.jpg"),
  product_images_attributes: [
    { image: open("https://images-na.ssl-images-amazon.com/images/I/51tOKq6TUNL._SL1001_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/513hmR6GtoL._SL1001_.jpg")},
    { image: open("https://images-na.ssl-images-amazon.com/images/I/31h%2B8L6%2BVmL.jpg") }
  ],
  product_particular_images_attributes: [
    { image: open("https://images-na.ssl-images-amazon.com/images/I/714wFTvZBXL._SL1001_.jpg") }
  ]
  )
  puts "成功建立1个商品：blink眼罩"
else
  puts "blink眼罩 已经存在"
end

## 旅行 6
if Product.find_by(title: "竹炭除味包").nil?
Product.create!(
 title: "竹炭除味包",
  description: "这款设计精美的除味包，内含100%天然竹炭，不含化学元素，没有特殊香气，24/7全天候吸除味道，有效寿命长达一年。",
  price: 69,
  quantity: 340,
  category_id: 1,
    particulars: " ",
  image: open("https://images-na.ssl-images-amazon.com/images/I/81CekYITyEL._SL1500_.jpg"),
  product_images_attributes: [
    { image: open("https://images-na.ssl-images-amazon.com/images/I/81CekYITyEL._SL1500_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/814i4BKAmML._SL1500_.jpg")},
    { image: open("https://images-na.ssl-images-amazon.com/images/I/91-mBWfGJPL._SL1500_.jpg") }
  ],
  product_particular_images_attributes: [
    { image: open("https://images-na.ssl-images-amazon.com/images/I/91jDsNC1NOL._SL1500_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/91NML4ETvuL._SL1500_.jpg")},
    { image: open("https://images-na.ssl-images-amazon.com/images/I/91xHLUDNnnL._SL1500_.jpg") }
  ]
  )
  puts "成功建立1个商品：竹炭除味包"
else
  puts "竹炭除味包 已经存在"
end



# 大孩子
## 大孩子 1
if Product.find_by(title: "发条金属步行机器人").nil?
Product.create!(

 title: "发条金属步行机器人",
  description: "扭动发条，可爱的小机器人就会走动。手臂可以活动，头部有弹簧，也适合当做摆件。材质：锡金属；尺寸：4.5“×2.5”×1.5",
  price: 63,
  quantity: 250,
  category_id: 2,
    particulars: " ",
  image: open("https://images-na.ssl-images-amazon.com/images/I/51nAg2LMT9L.jpg"),
  product_images_attributes: [
    { image: open("https://images-na.ssl-images-amazon.com/images/I/51nAg2LMT9L.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/61xJIPORTDL._SL1001_.jpg")},
    { image: open("https://images-na.ssl-images-amazon.com/images/I/61Bc-twNN8L._SL1001_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/61QlEkgLcNL._SL1001_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/61fAlBCjobL._SL1001_.jpg") }
  ],
  product_particular_images_attributes: [  { image: open("https://images-na.ssl-images-amazon.com/images/I/61Bc-twNN8L._SL1001_.jpg") }
  ]
)

  puts "成功建立1个商品：发条金属步行机器人"
else
  puts "发条金属步行机器人 已经存在"
end

## 大孩子 2
# if Product.find_by(title: "磁应力金属橡皮泥").nil?
# Product.create!(
#  title: "磁应力金属橡皮泥",
#   description: "让橡皮泥“活”起来！不仅能像普通橡皮泥一样可随意捏出各种造型，更能被磁铁所吸引！！试着把它塑造成眼镜蛇的造型，用磁铁就能让它摇头晃脑。白领及高压人士选择，缓解压力宣泄情绪之良品。",
#   price: 185,
#   quantity: 30,
#   category_id: 2,
#   image: open("https://images-na.ssl-images-amazon.com/images/I/51AMaD8ErgL._SL1000_.jpg"),
#   product_images_attributes: [
#     { image: open("https://images-na.ssl-images-amazon.com/images/I/51AMaD8ErgL._SL1000_.jpg") },
#     { image: open("https://images-na.ssl-images-amazon.com/images/I/51nYUv2TTtL.jpg")},
#     { image: open("https://images-na.ssl-images-amazon.com/images/I/519pUKZQCBL.jpg") },
#     { image: open("https://images-na.ssl-images-amazon.com/images/I/51weVsatkyL.jpg") }
#   ]
#   )
#   puts "成功建立1个商品：磁应力金属橡皮泥"
# else
#   puts "磁应力金属橡皮泥 已经存在"
# end

## 大孩子 3
if Product.find_by(title: "百变转角积木").nil?
Product.create!(
 title: "百变转角积木",
  description: "现代装饰作品，12种颜色模块和一个黑色球，可以很容易地扭曲和转向，尽情发挥想象，为您的办公桌提供无限创意。材质：枫木，无毒，水性涂料。",
  price: 199,
  quantity: 310,
  category_id: 2,
    particulars: " ",
  image: open("https://images-na.ssl-images-amazon.com/images/I/715XdM-LeKL._SL1500_.jpg"),
  product_images_attributes: [
    { image: open("https://images-na.ssl-images-amazon.com/images/I/715XdM-LeKL._SL1500_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/81NeGaP5uaL._SL1500_.jpg")},
    { image: open("https://images-na.ssl-images-amazon.com/images/I/81RI-eWnTbL._SL1500_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/81z3qlwIW3L._SL1500_.jpg") }
  ],
  product_particular_images_attributes: [
    { image: open("http://beyond123.com/images/pa/pa-angle1.jpg") },
    { image: open("http://beyond123.com/images/pa/pa-angle2.jpg") },
        { image: open("http://beyond123.com/images/pa/pa-angle-box.jpg") },
            { image: open("http://beyond123.com/images/pa/pa-angle3.jpg") },
  ]
  )
  puts "成功建立1个商品：百变转角积木"
else
  puts "百变转角积木 已经存在"
end

## 大孩子 4
# if Product.find_by(title: "减压松果风车").nil?
# Product.create!(
#  title: "减压松果风车",
#   description: "由三十八精密零件组装而成的松果风车，轻轻一甩就快速转动变形，带来视觉听觉的愉悦，办公室加压必备。材质：原木底座，黄铜管。",
#   price: 380,
#   quantity: 110,
#   category_id: 2,
#   image: open("https://images-na.ssl-images-amazon.com/images/I/81fbGRQ9LoL._SL1500_.jpg"),
#   product_images_attributes: [
#     { image: open("https://images-na.ssl-images-amazon.com/images/I/81fbGRQ9LoL._SL1500_.jpg") },
#     { image: open("https://images-na.ssl-images-amazon.com/images/I/81fM4oiAnTL._SL1500_.jpg")},
#     { image: open("https://images-na.ssl-images-amazon.com/images/I/81KCX6q15ZL._SL1500_.jpg") },
#     { image: open("https://images-na.ssl-images-amazon.com/images/I/81DH8vE%2BirL._SL1500_.jpg") }
#   ]
#   )
#   puts "成功建立1个商品：减压松果风车"
# else
#   puts "减压松果风车 已经存在"
# end

## 大孩子 5
if Product.find_by(title: "DJI Inspire2 专业航拍无人机").nil?
Product.create!(
 title: "DJI Inspire2 专业航拍无人机",
  description: "Inspire 2是DJI用了两年时间，把在飞控、动力、云台、导航、图传、相机、视觉等领域取得的成果，全部应用在了Inspire 2上。小巧、便携、可拆换的专属相机云台、可拍RAW和ProRes格式视频、能避障、支持智能飞行(拍摄)、拥有强劲动力、长航时等特性。",
  price: 18888,
  quantity: 50,
  category_id: 2,
    particulars: " ",
  image: open("https://images-na.ssl-images-amazon.com/images/I/51IwGeRZ6xL._SL1200_.jpg"),
  product_images_attributes: [
    { image: open("https://images-na.ssl-images-amazon.com/images/I/51IwGeRZ6xL._SL1200_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/51di-iOO8aL._SL1200_.jpg")},
    { image: open("https://images-na.ssl-images-amazon.com/images/I/51BmxjKoZJL._SL1200_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/51vm7DK9dxL._SL1200_.jpg") }
  ],
  product_particular_images_attributes: [
    { image: open("https://gounmanned.com/images/product/xmedium_ac56a2b9-867d-4ddb-840d-36f991bb4114.png.pagespeed.ic.F6nrtxChCI.png") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/610Y80gVBYL._SL1200_.jpg") },
  ]
  )
  puts "成功建立1个商品：DJI Inspire2 专业航拍无人机"
else
  puts "DJI Inspire2 专业航拍无人机 已经存在"
end

## 大孩子 6
if Product.find_by(title: "电动积木机器人").nil?
Product.create!(
 title: "电动积木机器人",
  description: "Inspire 2是DJI用了两年时间，把在飞控、动力、云台、导航、图传、相机、视觉等领域取得的成果，全部应用在了Inspire 2上。小巧、便携、可拆换的专属相机云台、可拍RAW和ProRes格式视频、能避障、支持智能飞行(拍摄)、拥有强劲动力、长航时等特性。",
  price: 99,
  quantity: 200,
  category_id: 2,
    particulars: " ",
  image: open("https://images-na.ssl-images-amazon.com/images/I/61XOGLWIGSL._SL1001_.jpg"),
  product_images_attributes: [
    { image: open("https://images-na.ssl-images-amazon.com/images/I/61Hbd94vtKL._SL1001_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/61XOGLWIGSL._SL1001_.jpg")},
    { image: open("https://images-na.ssl-images-amazon.com/images/I/61rrQqp-01L._SL1001_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/71e3NM1WBQL._SL1001_.jpg") }
  ],
  product_particular_images_attributes: [
    { image: open("https://images-na.ssl-images-amazon.com/images/I/61JdcMKxm4L._SL1001_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/71lsJT5uydL._SL1001_.jpg") },
      { image: open("https://images-na.ssl-images-amazon.com/images/I/71hutwOcCVL._SL1001_.jpg") }
  ]

  )
  puts "成功建立1个商品：电动积木机器人"
else
  puts "电动积木机器人 已经存在"
end

# 中世纪 类别产品
## 中世纪 1
if Product.find_by(title: "LexMod Remark沙发").nil?
Product.create!(
 title: "LexMod Remark沙发",
  description: "中世纪风格扶手椅，天然枫木椅脚，100%纯麻布表面，无需安装。",
  price: 5000,
  quantity: 40,
  category_id: 3,
    particulars: " ",
  image: open("https://images-na.ssl-images-amazon.com/images/I/81tl4QP%2BYxL._SL1500_.jpg"),
  product_images_attributes: [
    { image: open("https://images-na.ssl-images-amazon.com/images/I/81tl4QP%2BYxL._SL1500_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/81J%2BDzITFDL._SL1500_.jpg")},
    { image: open("https://images-na.ssl-images-amazon.com/images/I/81QcITT%2BVnL._SL1500_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/81QrLvnD8GL._SL1500_.jpg") }
  ]
  )
  puts "成功建立1个商品：LexMod Remark沙发"
else
  puts "LexMod Remark沙发 已经存在"
end


## 中世纪 2
if Product.find_by(title: "Eames椅子").nil?
Product.create!(
 title: "Eames椅子",
  description: "中世纪风格扶手椅，天然枫木椅脚，贴合身形，无需安装。",
  price: 1690,
  quantity: 340,
  category_id: 3,
      particulars: " ",
  image: open("https://images-na.ssl-images-amazon.com/images/I/51VGCi3Sr9L._SL1000_.jpg"),
  product_images_attributes: [
    { image: open("https://images-na.ssl-images-amazon.com/images/I/51VGCi3Sr9L._SL1000_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/41Q%2B3l88xeL.jpg")},
    { image: open("https://images-na.ssl-images-amazon.com/images/I/51akvnCS%2BzL._SL1000_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/515-02s1ZHL.jpg") }
  ],
  product_particular_images_attributes: [
    { image: open("https://images-na.ssl-images-amazon.com/images/I/51aWFQ3miYL._SL1000_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/81A2VzjFmmL._SL1500_.jpg") },
      { image: open("https://images-na.ssl-images-amazon.com/images/I/51zzrFBB4WL._SL1000_.jpg") }
  ]
  )
  puts "成功建立1个商品：Eames椅子"
else
  puts "Eames椅子 已经存在"
end

# 厨具 类别产品
## 厨具 1
if Product.find_by(title: "KitchenAid 专业级厨师机").nil?
Product.create!(
 title: "KitchenAid 专业级厨师机",
  description: "10种糖果色装点厨房。多功能厨师机，具有67种不同的操作方式，解放主妇双手，献给一家子的美味神器。",
  price: 6690,
  quantity: 340,
  category_id: 4,
      particulars: " ",
  image: open("https://images-na.ssl-images-amazon.com/images/I/61hxThYm8EL._SL1000_.jpg"),
  product_images_attributes: [
    { image: open("https://images-na.ssl-images-amazon.com/images/I/61hxThYm8EL._SL1000_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/61RraI56R3L._SL1000_.jpg")},
    { image: open("https://images-na.ssl-images-amazon.com/images/I/61I0WcOPJoL._SL1000_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/517d843EgYL._SL1000_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/51BLcCyeLNL._SL1000_.jpg") }
  ],
  product_particular_images_attributes: [
    { image: open("https://images-na.ssl-images-amazon.com/images/I/61bkGASdxGL._SL1000_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/61PcLU13ioL._SL1000_.jpg") },
      { image: open("https://images-na.ssl-images-amazon.com/images/I/51EIvZ99kzL._SL1000_.jpg") }
  ]
  )
  puts "成功建立1个商品：KitchenAid 专业级厨师机"
else
  puts "KitchenAid 专业级厨师机 已经存在"
end

## 厨具 2
if Product.find_by(title: "玻璃糖果罐").nil?
Product.create!(
 title: "玻璃糖果罐",
  description: "手工纯皮拎手，高品质无铅玻璃，纯原木密封盖，密封性良好，设计精美，装点厨房必备。",
  price: 6690,
  quantity: 340,
  category_id: 4,
    particulars: "",
  image: open("https://images-na.ssl-images-amazon.com/images/I/71ZVo80Ho3L._SL1500_.jpg"),
  product_images_attributes: [
    { image: open("https://images-na.ssl-images-amazon.com/images/I/71ZVo80Ho3L._SL1500_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/61TP4zmR5EL._SL1500_.jpg")},
    { image: open("https://images-na.ssl-images-amazon.com/images/I/713jDi%2BIpbL._SL1500_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/71LQ4zZEaYL._SL1500_.jpg") }
  ]
  )
  puts "成功建立1个商品：玻璃糖果罐"
else
  puts "玻璃糖果罐 已经存在"
end



# 公仔 类别产品
## 公仔 1
if Product.find_by(title: "猫头鹰公仔").nil?
Product.create!(
 title: "猫头鹰公仔",
  description: "萌萌的，小小的，摆在角落，放在床头，旅行摆拍皆宜。",
  price: 6690,
  quantity: 340,
  category_id: 5,
    particulars: " ",
  image: open("https://images-na.ssl-images-amazon.com/images/I/71LVEs59kQL._SX522_.jpg"),
  product_images_attributes: [
    { image: open("https://images-na.ssl-images-amazon.com/images/I/71LVEs59kQL._SX522_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/618tWUXN%2BYL._SL1000_.jpg")},
    { image: open("https://images-na.ssl-images-amazon.com/images/I/619YycuJUFL._SL1000_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/61WNKHlc47L._SL1000_.jpg") }

  ]
  )
  puts "成功建立1个商品：猫头鹰公仔"
else
  puts "猫头鹰公仔 已经存在"
end


# 木质 类别产品
## 木质 1
if Product.find_by(title: "木质蓝牙键盘").nil?
Product.create!(
 title: "木质蓝牙键盘",
  description: "摆脱传统键盘的塑料感，让原木的温润始终在指尖流淌。",
  price: 6690,
  quantity: 340,
  category_id: 6,
    particulars: " ",
  image: open("https://images-na.ssl-images-amazon.com/images/I/616mifjqXNL._SL1000_.jpg"),
  product_images_attributes: [
    { image: open("https://images-na.ssl-images-amazon.com/images/I/616mifjqXNL._SL1000_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/61EwFvyiR5L._SL1000_.jpg")},
    { image: open("https://images-na.ssl-images-amazon.com/images/I/618kBlKk7JL._SL1000_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/61plXGYq7GL._SL1000_.jpg") }

  ]
  )
  puts "成功建立1个商品：木质蓝牙键盘"
else
  puts "木质蓝牙键盘 已经存在"
end


# 植物 类别产品
## 植物 1
if Product.find_by(title: "陶土花盆").nil?
Product.create!(
 title: "陶土花盆",
  description: "给你的植物换个有质感的家",
  price: 6690,
  quantity: 340,
  category_id: 7,
      particulars: " ",
  image: open("https://images-na.ssl-images-amazon.com/images/I/A1vdg%2BEm7rL._SL1500_.jpg"),
  product_images_attributes: [
    { image: open("https://images-na.ssl-images-amazon.com/images/I/A1vdg%2BEm7rL._SL1500_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/91Ja%2B6fbrPL._SL1500_.jpg")},
    { image: open("https://images-na.ssl-images-amazon.com/images/I/91yhY7U3v5L._SL1500_.jpg") },
    { image: open("https://images-na.ssl-images-amazon.com/images/I/91g-Ll8sFYL._SL1500_.jpg") }
  ]
  )
  puts "成功建立1个商品：陶土花盆"
else
  puts "陶土花盆 已经存在"
end
