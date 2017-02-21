# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u1 = User.new
u1.email = "xzhang@deloitte.com.cn"
u1.password = "123456"
u1.password_confirmation = "123456"
u1.is_admin = true
u1.save

u2 = User.new
u2.email = "caijia@b.c"
u2.password = "123456"
u2.password_confirmation = "123456"
u2.is_admin = true
u2.save
