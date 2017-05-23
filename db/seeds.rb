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
  puts "Admin已建好，账号为#{u.email}，密码为#{u.password}"
else
  puts "Admin已存在，脚本跳过此步骤。"
end

#Initialize Product

Product.create!(title: "写给女生的五个择偶建议",
  description: "建议",
  price: 199,
  quantity: 1000,
  image: open("http://ww1.sinaimg.cn/large/006tNbRwgy1ffvayld8o1j30qo0f074q.jpg")
  )
