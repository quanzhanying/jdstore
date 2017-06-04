# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.new(email: "administer1@jd.com", password: "123456", password_confirmation: "123456")
u.save
u.is_admin = true
u.save

Category.create(name: "宫廷燕窝")
Category.create(name: "美肤香体")
Category.create(name: "零食干果")
Category.create(name: "精油药膏")
