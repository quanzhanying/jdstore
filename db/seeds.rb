# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "This seed document will automatically generate 1 admin account and 1 normal account"

create_account = User.create([email: 'davidzhu126@126.com', password: '12345678', password_confirmation: '12345678', is_admin: 'true'])
puts "Admin account created."

create_account = User.create([email: 'dyz2102@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false'])
puts "Normal account created."
