# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Initialize Admin User
if User.find_by(email: "chanweiyan007@gmail.com").nil?
  u = User.new
  u.email = "chanweiyan007@gmail.com"           # 可以改成自己的 email
  u.password = "123456"                # 最少要六码
  u.password_confirmation = "123456"   # 最少要六码
  u.is_admin = true
  u.save
  puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
else
  puts "Admin 已经建立过了，脚本跳过该步骤。"
end

#新增类别category
if Category.all.blank?
  10.times{ |i| Category.create(:name => "类别 #{i}")}
  puts "新增#{Category.all.count}个类别。"
else
  puts "category类别已经建立过了，脚本跳过该步骤。"
end

#新增分组group
if Group.all.blank?
  20.times{ |i| Group.create(:name => "group #{i}")}
  puts "新增#{Group.all.count}类别。"
else
  puts "Group 已经新增过，脚本跳过该步骤。"
end

# Initialize Product
if Product.all.blank?

  Product.create!(title: "QC-35",
    description: "耳机",
    price: 2800,
    quantity: 5,
    # image: open("https://images-cn.ssl-images-amazon.com/images/I/41bVSMLUllL._AC_UL320_SR320,320_.jpg"),
    category_id: Category.last.id
    )

  Product.create!(title: "Iphone7",
    description: "手机",
    price: 5000,
    quantity: 5,
    # image: open("https://images-cn.ssl-images-amazon.com/images/I/51q3gdJGenL._SL800_.jpg"),
    category_id: Category.last.id
    )

  Product.create!(title: "Cherry Keyboard",
    description: "G80-3000键盘",
    price: 2800,
    quantity: 5,
    # image: open("https://images-cn.ssl-images-amazon.com/images/I/41LN-bXtA7L._AC_UL320_SR320,320_.jpg"),
    category_id: Category.last.id
    )

  puts "新建 #{Product.all.count} 个商品"

else
  puts "Product 已经新建过，脚本跳过该步骤。"
end
