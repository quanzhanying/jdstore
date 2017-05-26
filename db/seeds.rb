# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 建立 Admin User

if User.find_by(email: "admin@test.com").nil?
 u = User.new
 u.email = "admin@test.com"           # 可以改成自己的 email

 u.password = "111111"                # 最少要六码

 u.password_confirmation = "111111"   # 最少要六码

 u.is_admin = true
 u.save
 puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
else
 puts "Admin 已经建立过了，脚本跳过该步骤。"
end

# Initialize Product

# Initialize Product Photos

#下面兩個方法2選1

#方法1.先將照片上傳到iPic或其他位置，建議用這個方法

# Photo.create!(product_id:1,avatar: open('https://ws3.sinaimg.cn/large/006tNbRwgy1ffy02ugmsuj30eg0egq3q.jpg'))
# Photo.create!(product_id:1,avatar: open('https://ws3.sinaimg.cn/large/006tNbRwgy1ffy0524rsfj30eg0egmyp.jpg'))
# Photo.create!(product_id:1,avatar: open('https://ws2.sinaimg.cn/large/006tNbRwgy1ffy05lzf92j30eg0eg74k.jpg'))

#方法2.照片在本地，先把照片放在 /app/assets/images/products 裡面一起推到heroku

#但git push heroku完要馬上跑seed.否則圖會被heroku刪除

# Photo.create!(product_id:1,avatar: open(File.join(Rails.root, "/app/assets/images/products/1-1.jpg")))
# Photo.create!(product_id:1,avatar: open(File.join(Rails.root, "/app/assets/images/products/1-2.jpg")))
