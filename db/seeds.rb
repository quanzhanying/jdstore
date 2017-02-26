# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "test@gmail.com", password: "123456", password_confirmation: "123456", is_admin: false)
User.create(email: "admin@gmail.com", password: "123456", password_confirmation: "123456", is_admin: true)
Category.create(name: "文具")
Category.create(name: "收纳")
Category.create(name: "旅行")
