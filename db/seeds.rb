# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "a@1", password: "111222", password_confirmation: "111222", is_admin: true)

u = User.newe
u.email = "admin@2"
u.password = "111222"
u.password_confirmation = "111222"
u.is_admin = true
u.save
