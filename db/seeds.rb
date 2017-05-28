# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Initialize Boss User
if User.find_by(email: "boss@jdstore.com").nil?
  u = User.new
  u.email = "boss@jdstore.com" #可以改成自己的email
  u.password = "666666"
  u.password_confirmation = "666666"
  u.is_admin = true
  u.save
  puts "账号为#{u.email}、密码为#{u.password}的管理员账户已经建好。"
else
  puts "账号为boss@jdstore.com的管理员账户已存在。"
end

#Initialize Product
#product 1
Product.create!(title: "给女生的五个择偶建议",
  description: "择偶与天使投资有很多相似之处",
  price: 299,
  quantity: 1000,
  image: open("http://ww1.sinaimg.cn/large/006tNbRwgy1ffvayld8o1j30qo0f074q.jpg")
  )

#product 2
Product.create!(title: "给自尊心强的人的建议",
  description: "自尊心强是进步的障碍",
  price: 199,
  quantity: 1000,
  image: open("http://ww4.sinaimg.cn/large/006tNbRwgy1ffvbbctatoj30hs0fqmxz.jpg")
  )

#product 3
Product.create!(title: "如何避免被情绪左右",
  description: "redirect",
  price: 99,
  quantity: 1000,
  image: open("http://ww1.sinaimg.cn/large/006tKfTcgy1ffvbkmras4j30hs0b5dh6.jpg")
  )

#product 4
Product.create!(title: "如何识人",
  description: "交友不能随缘",
  price: 99,
  quantity: 1000,
  image: open("http://ww4.sinaimg.cn/large/006tKfTcgy1ffvbpx1pf3j30hs0hsjtv.jpg")
  )

#product 5
Product.create!(title: "如何开始理财",
  description: "答案很容易，做到很难",
  price: 29,
  quantity: 10000,
  image: open("http://ww2.sinaimg.cn/large/006tKfTcgy1ffvby2m0rnj30dc0aa75d.jpg")
  )
