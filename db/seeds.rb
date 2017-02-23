# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.new
u.email = "admin@gmail.com"
u.password = "123456"
u.password_confirmation = "123456"
u.is_admin = true
u.save

puts "1 admin account created."

products = ["全棉针织条纹四件套 新款", "可水洗舒柔丝羽绒枕", "日式记忆绵坐垫", "北欧风珊瑚绒多功能暖脚套", "白色斜磨陶瓷刀", "懒人抹布", "日式酸枣木碗", "10双装 实木筷"]

products_description = ["裸睡享受，柔软透气有弹性", "柔软舒适深睡眠", "活性炭记忆绵，缓解压力", "时尚舒适", "锋利耐用", "轻松去除污渍", "轻便", "易清洗"]

products_prices = [299, 59, 59, 59, 89, 13.99, 39, 25]

products_categories = ["home", "kitchen"]

products_images = ["public/images/bed.png", "public/images/pillow.png", "public/images/sitting.png", "public/images/foot.png", "public/images/knife.png", "public/images/duster.png", "public/images/bowl.png", "public/images/chopsticks.png"]

create_jobs = for i in 1..4 do
  Product.create!([title: products[i - 1], description: products_description[i - 1], quantity: rand(0..2), price: products_prices[i - 1], image: File.open(File.join(Rails.root, products_images[i - 1])), categories: products_categories[0]])
end
puts "4 home products created."

create_jobs = for i in 5..8 do
  Product.create!([title: products[i - 1], description: products_description[i - 1], quantity: rand(0..2), price: products_prices[i - 1], image: File.open(File.join(Rails.root, products_images[i - 1])), categories: products_categories[1]])
end
puts "4 kitchen products created."
