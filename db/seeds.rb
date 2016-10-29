# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
create_account = User.create([email:'f@b.com', password:'fbfbfb', password_confirmation:'fbfbfb'])

create_jos = for i in 1..10 do
  Product.create!([title:"Product no.#{i}", description:"This is No. #{i} Product created by the seed", quantity: rand(1.99), price: rand(1..99)])
end
