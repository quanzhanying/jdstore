# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u=User.new
u.email= "xyy123@gmail.com"
u.password= "xyy123"
u.password_confirmation="xyy123"
u.is_admin=true
u.save






Product.create!(title:"家庭聚会包",quantity:100,price:20,kind:"set",
owner:"shop1",place:"夏威夷",position:1,image: open("http://ww1.sinaimg.cn/large/006tNc79gy1fdc14dqrhfj307o053glo.jpg"))



Product.create!(title:"紫葡萄",quantity:100,price:5,kind:"fruit",
owner:"shop1",place:"中国",position:2,image: open("http://ww3.sinaimg.cn/large/006tNc79gy1fdd9znju58j30ek087wgb.jpg"))


Product.create!(title:"水果沙拉",quantity:100,price:10,kind:"salad",
owner:"shop1",place:"中国",position:3,image: open("http://ww4.sinaimg.cn/large/006tNc79gy1fdd9ys2agdj30ek09qt94.jpg"))

Product.create!(title:"水果套餐",quantity:100,price:20,kind:"set",
owner:"shop1",place:"中国",position:4,image: open("http://ww4.sinaimg.cn/large/006tNc79gy1fdda0gj0pvj30ek09qdgd.jpg"))


Product.create!(title:"草莓",quantity:100,price:20,kind:"fruit",
owner:"shop2",place:"菲律宾",position:5,image: open("http://ww4.sinaimg.cn/large/006tNc79gy1fdda156kbtj30el09q74z.jpg"))

Product.create!(title:"青葡萄",quantity:100,price:20,kind:"fruit",
owner:"shop2",place:"菲律宾",position:6,image: open("http://ww4.sinaimg.cn/large/006tNc79gy1fdda2g92dsj30el09qmxl.jpg"))

Product.create!(title:"沙拉",quantity:100,price:10,kind:"salad",
owner:"shop2",place:"中国",position:7,image: open("http://ww1.sinaimg.cn/large/006tNc79gy1fdda4awdbhj30ek09qt94.jpg"))

Product.create!(title:"核桃",quantity:100,price:20,kind:"nut",
owner:"shop2",place:"中国",position:8,image: open("http://ww4.sinaimg.cn/large/006tNc79gy1fdda52ih8bj30el09q74t.jpg"))

Product.create!(title:"开心果",quantity:100,price:20,kind:"nut",
owner:"shop2",place:"海南",position:9,image: open("http://ww3.sinaimg.cn/large/006tNc79gy1fdda6ahbxoj30ej09qjs8.jpg"))


Product.create!(title:"樱桃",quantity:100,price:20,kind:"fruit",
owner:"shop3",place:"菲律宾",position:10,image: open("http://ww3.sinaimg.cn/large/006tNc79gy1fdda7jusazj30el088dgu.jpg"))

Product.create!(title:"红树莓",quantity:100,price:20,kind:"fruit",
owner:"shop3",place:"菲律宾",position:11,image: open("http://ww3.sinaimg.cn/large/006tNc79gy1fdda8qatb5j30el09qjrz.jpg"))

Product.create!(title:"红树莓",quantity:100,price:20,kind:"fruit",
owner:"shop3",place:"菲律宾",position:12,image: open("http://ww3.sinaimg.cn/large/006tNc79gy1fdda8qatb5j30el09qjrz.jpg"))

Product.create!(title:"菠萝",quantity:100,price:20,kind:"fruit",
owner:"shop3",place:"夏威夷",position:13,image: open("http://ww1.sinaimg.cn/large/006tNc79gy1fdda9aigaxj30el09qt99.jpg"))





Product.create!(title:"杏仁",quantity:100,price:20,kind:"nut",
owner:"shop3",place:"中国",position:14,image: open("http://ww3.sinaimg.cn/large/006tNc79gy1fddaaqm3eij31kw11xu0x.jpg"))

Product.create!(title:"开心果",quantity:100,price:20,kind:"nut",
owner:"shop3",place:"海南",position:15,image: open("http://ww3.sinaimg.cn/large/006tNc79gy1fddacb21mpj30el09qgm4.jpg"))
