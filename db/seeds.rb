# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u=User.new
u.email= "xyy321@gmail.com"
u.password= "xyy321"
u.password_confirmation="xyy321"
u.is_admin=true
u.save



def seed_image(file_name)
  File.open(File.join(Rails.root, "public/images/seed/#{file_name}.jpg"))
end



products = [
  {:title => '菠萝'}

]

products.each do |attributes|
  attributes[:image] = seed_image('nangua')
  Product.find_or_create_by(attributes[:title], attributes)
end
