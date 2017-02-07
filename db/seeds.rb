# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Hello World!'
puts '這個種子檔會自動建立一個admin帳號和一个测试账号'

create_account = User.create([name: 'admin', email: 'admin@gmail.com', password: '111111', password_confirmation: '111111', is_admin: 'true'])
puts 'Admin account is created successfully!'

create_account = User.create([name: 'test', email: 'test@gmail.com', password: '111111', password_confirmation: '111111', is_admin: 'false'])
puts 'Test account is created successfully!'
