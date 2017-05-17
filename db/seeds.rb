# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.find_by(email: "superzrr@test.com").nil?
  u = User.new
  u.email = "superzrr@test.com"           # 可以改成自己的 email
  u.password = "123456"                # 最少要六码
  u.password_confirmation = "123456"   # 最少要六码
  u.is_admin = true
  u.save
  puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
else
  puts "Admin 已经建立过了，脚本跳过该步骤。"
end


# Initialize Product

Product.create!(title: "海军小斗篷雨衣",
  description: "斗篷连帽，360°防雨",
  price: 99,
  quantity: 5,
  image: open("http://yanxuan.nosdn.127.net/90d18ab49bf5ccdb10b75f19e5299a31.png?imageView&quality=95&thumbnail=245x245")
  )

Product.create!(title: "格纹棉质褶皱短裙（女童）",
  description: "经典格纹，可爱百褶",
  price: 89,
  quantity: 5,
  image: open("http://yanxuan.nosdn.127.net/4271f37a282da1fe17284a15fe0e8354.png?imageView&quality=95&thumbnail=245x245")
  )

Product.create!(title: "格纹棉质短袖衬衫（男童）",
  description: "经典格纹，内外兼搭",
  price: 99,
  quantity: 5,
  image: open("http://yanxuan.nosdn.127.net/40001f14b3d23a77717c668979f68268.png?imageView&quality=95&thumbnail=245x245")
  )

Product.create!(title: "日式儿童雨伞",
  description: "开合安全，日本制造标准",
  price: 59,
  quantity: 5,
  image: open("http://yanxuan.nosdn.127.net/0634fbccf23b1139c5ea1277db065f48.png?imageView&quality=95&thumbnail=245x245")
  )
