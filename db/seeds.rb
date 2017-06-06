# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



u = User.new
u.email = "amy87326@163.com"  #可以是自己的email
u.password = "123456"         #最少6位
u.password_confirmation = "123456" #最少6位
u.is_admin = true
u.save

# Category.create(:name => "男性健康餐")
# Category.create(:name => "女性健康餐")
# Category.create(:name => "随心健康餐")

Product.create!(title:"男性健身餐",description:"专为男性设计的健身午餐",quantity:100,price:150,image: open("http://oqmcovki6.bkt.clouddn.com/uploads/product/image/1/medium_man-gym-muscle-fitness-38908.jpeg"))
Product.create!(title:"女性健身餐",description:"专为女性设计的健身午餐",quantity:100,price:150,image: open("http://oqmcovki6.bkt.clouddn.com/uploads/product/image/2/medium_pexels-photo-196640.jpeg"))
Product.create!(title:"随心餐",description:"随意吃，开心就好",quantity:100,price:150,image: open("https://ws4.sinaimg.cn/large/006tKfTcgy1fg7z491709j30hs0budhf.jpg"))
