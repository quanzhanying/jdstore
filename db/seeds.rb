puts "这个seed会自动建立一个admin账号, 并且 10 个 商品信息, 库存依次为0-9；没有图片"

create_account = User.create([email: 'admin1@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'true'])
puts "Admin1 account created."

create_account = User.create([email: 'user1@gmail.com', password: '12345678', password_confirmation: '12345678', is_admin: 'false'])
puts "User1 account created."

create_products = for i in 1..10 do
  Product.create!([title: "Product no.#{i}", description: "这是用seed建立的第 #{i} 个产品", quantity: "#{i-1}", price: rand(100), image: "http://imageshack.com/a/img924/1556/GXBptx.png"])
end
  puts "10 Products created."
