# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Initialize Boss User
if User.find_by(email: "boss@jdstore.com").nil?
  puts "boss@jdstore.com的管理员账号不存在，现在为您注册……"
  u = User.new
  u.email = "boss@jdstore.com" #可以改成自己的email
  u.password = "666666"
  u.password_confirmation = "666666"
  u.is_admin = true
  u.save
  puts "账号注册成功！"
else
  puts "账号为boss@jdstore.com的管理员账户已存在，无需重新注册。"
end

Product.delete_all
puts "原有商品已全部删除，正在重新创建新商品......"

#Initialize Product
#product 1
Product.create!(title: "给女生的五个择偶建议",
  description: "择偶与天使投资有很多相似之处",
  price: 199,
  quantity: 1000,
  link: "https://mp.weixin.qq.com/s?__biz=MzAxNzI4MTMwMw==&mid=210316058&idx=1&sn=a40364e7973711b79a81b069c73d72bf&scene=4#wechat_redirect",
  category_id: 1,
  image: open("http://ww1.sinaimg.cn/large/006tNbRwgy1ffvayld8o1j30qo0f074q.jpg")
  )
puts "1号产品创建成功！"

#product 2
Product.create!(title: "给自尊心强的人的建议",
  description: "自尊心强是进步的障碍",
  price: 199,
  quantity: 1000,
  link: "https://mp.weixin.qq.com/s?__biz=MzAxNzI4MTMwMw==&mid=210580935&idx=1&sn=b9417990f4ffae5e37551bdc8e564d49&scene=4#wechat_redirect",
  category_id: 1,
  image: open("http://ww4.sinaimg.cn/large/006tNbRwgy1ffvbbctatoj30hs0fqmxz.jpg")
  )
puts "2号产品创建成功！"

#product 3
Product.create!(title: "如何避免被情绪左右",
  description: "redirect",
  price: 199,
  quantity: 1000,
  link: "https://mp.weixin.qq.com/s?__biz=MzAxNzI4MTMwMw==&mid=210553384&idx=1&sn=dbcfd09da0f8afcc18c4f3764f54442a&scene=4#wechat_redirect",
  category_id: 1,
  image: open("http://ww3.sinaimg.cn/large/006tNbRwgy1ffwk81k8ncj30hs0ccjsd.jpg")
  )
puts "3号产品创建成功！"

#product 4
Product.create!(title: "如何识人",
  description: "交友不能随缘",
  price: 199,
  quantity: 1000,
  link: "https://mp.weixin.qq.com/s?__biz=MzAxNzI4MTMwMw==&mid=210477917&idx=2&sn=0e6c66af524afec39e7c3bfc18eb2901&scene=4#wechat_redirect",
  category_id: 1,
  image: open("http://ww4.sinaimg.cn/large/006tKfTcgy1ffvbpx1pf3j30hs0hsjtv.jpg")
  )
puts "4号产品创建成功！"

#product 5
Product.create!(title: "为什么及如何精读",
  description: "随便翻翻就行的书，看它干吗？",
  price: 99,
  quantity: 10000,
  link: "https://mp.weixin.qq.com/s?__biz=MzAxNzI4MTMwMw==&mid=210820294&idx=1&sn=0111904831e1081a22312121092fecbf&scene=4#wechat_redirect",
  category_id: 2,
  image: open("http://ww2.sinaimg.cn/large/006tNbRwgy1ffwkrarcbgj30hs07fwew.jpg")
  )
puts "5号产品创建成功！"

#product 6
Product.create!(title: "十分钟重修语文",
  description: "词汇、语法、逻辑、文风……",
  price: 99,
  quantity: 10000,
  link: "https://mp.weixin.qq.com/s?__biz=MzAxNzI4MTMwMw==&mid=210835224&idx=1&sn=85789ec62f088e4b2934913af2369003&scene=4#wechat_redirect",
  category_id: 2,
  image: open("http://ww4.sinaimg.cn/large/006tNbRwgy1ffwku7616yj30hs099q3j.jpg")
  )
puts "6号产品创建成功！"

#product 7
Product.create!(title: "如何收集好书",
  description: "顺藤摸瓜",
  price: 99,
  quantity: 10000,
  link: "https://mp.weixin.qq.com/s?__biz=MzAxNzI4MTMwMw==&mid=210269216&idx=1&sn=51303ef3b76cd32277ea66fb3e23a2d2&scene=4#wechat_redirect",
  category_id: 2,
  image: open("http://ww4.sinaimg.cn/large/006tNbRwgy1ffwkwcy4f3j30hs0azach.jpg")
  )
puts "7号产品创建成功！"

#product 8
Product.create!(title: "为啥人丑就要多读书？",
  description: "Smart is the new sexy.",
  price: 99,
  quantity: 10000,
  link: "https://mp.weixin.qq.com/s?__biz=MzAxNzI4MTMwMw==&mid=400010714&idx=1&sn=70260d020b48efa79ef339ac27ef8886&scene=4#wechat_redirect",
  category_id: 2,
  image: open("http://ww2.sinaimg.cn/large/006tNbRwgy1ffwl1lyfh6j30hs0aamxt.jpg")
  )
puts "8号产品创建成功！"

#product 9
Product.create!(title: "如何开始理财",
  description: "答案很容易，做到很难",
  price: 299,
  quantity: 100000,
  link: "https://mp.weixin.qq.com/s?__biz=MzAxNzI4MTMwMw==&mid=210879361&idx=1&sn=9488460e9f6b8f95255f1d037a1925b6&scene=4#wechat_redirect",
  category_id: 3,
  image: open("http://ww2.sinaimg.cn/large/006tKfTcgy1ffvby2m0rnj30dc0aa75d.jpg")
  )
puts "9号产品创建成功！"

#product 10
Product.create!(title: "我是如何获得财务自由的",
  description: "逃逸速度",
  price: 299,
  quantity: 100000,
  link: "https://mp.weixin.qq.com/s?__biz=MzAxNzI4MTMwMw==&mid=400875301&idx=1&sn=c5374f87d9676259f7f16d7b48c6ca0e&scene=4#wechat_redirect",
  category_id: 3,
  image: open("http://ww2.sinaimg.cn/large/006tNbRwgy1ffwklf0ymlj30hs0dw0tt.jpg")
  )
puts "10号产品创建成功！"

#product 11
Product.create!(title: "赚钱的最正确姿势",
  description: "猜猜看",
  price: 299,
  quantity: 100000,
  link: "https://mp.weixin.qq.com/s?__biz=MzAxNzI4MTMwMw==&mid=210912190&idx=1&sn=f5bee2b2750929ee0074efb8dfbe4cd1&scene=4#wechat_redirect",
  category_id: 3,
  image: open("http://ww3.sinaimg.cn/large/006tNbRwgy1ffwknbzr6gj30hs068mxy.jpg")
  )
puts "11号产品创建成功！"

#product 12
Product.create!(title: "哪些钱不能省",
  description: "书，工具，安全……",
  price: 299,
  quantity: 100000,
  link: "https://mp.weixin.qq.com/s?__biz=MzAxNzI4MTMwMw==&mid=211036079&idx=1&sn=f84caaefd809c50853691c669b35b5b0&scene=4#wechat_redirect",
  category_id: 3,
  image: open("http://ww2.sinaimg.cn/large/006tNbRwgy1ffwkpol2b8j30hs05ljsc.jpg")
  )
puts "12号产品创建成功！"
