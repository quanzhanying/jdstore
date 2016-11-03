# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

create_account = User.create([email: 'atlantis.ray@gmail.com', password: '111111', password_confirmation: '111111', is_admin: 'true'])
create_account = User.create([email: '458112682@qq.com', password: '111111', password_confirmation: '111111', is_admin: 'false'])

create_address = DeliveryAddress.create([name: '大花', address: '北京市朝阳区建外soho东区8号楼2802', phone: '13333445678', user_id: 2])


# create_products = for i in 1..10 do
#   Product.create!([title: "Product no.#{i}", description: "這是用種子建立的第 #{i} 個商品", price: rand(50..99)*100, quantity: 10])
# end