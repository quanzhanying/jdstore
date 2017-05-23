# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 u = User.new
 u.email = "admin@test.com"          # can change to own email

 u.password = "123456"                  # at least 6 digit

 u.password_confirmation = "123456"     # at least 6 digit

 u.is_admin = true
 u.save



 
