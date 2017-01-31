# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

create_account = User.create([email: "a@a.com", password:"123456",password_confirmation: "123456",is_admin:"true"])
puts "Admin account created."
create_account_user = User.create([email: "b@b.com", password:"123456",password_confirmation: "123456",is_admin:"false"])
puts "User account created."

# create_products = for i in 1..15  do
# 	product_title

# end