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

Category.create!(:name => "男性健康餐")
Category.create!(:name => "女性健康餐")
Category.create!(:name => "随心健康餐")
