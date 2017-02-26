# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rubygems'
require 'json'

puts 'seed 数据自动创建'

User.create(email: 'cw@test.com', password: '123456', password_confirmation: '123456', is_admin: 'false')
puts 'create user: cw@test.com,  not admin'

User.create(email: 'admin@test.com', password: '123456', password_confirmation: '123456', is_admin: 'true')
puts 'create user: admin@test.com,  is admin'
# for i in 1..5 do
#   Product.create(title: "Product#{i}", description: "description#{i}", quantity: i*10, price: i*100)
# end
# puts 'create product : 5'
puts Dir.pwd
puts '从josn文件导入趣玩网商品数据'

# goods_base.json
json = File.read('./db/seedjson/goods_base.json')
obj = JSON.parse(json)
count = obj['RECORDS'].count
puts "商品基本信息#{count}条导入中......"
for i in 0...count do
    item = obj['RECORDS'][i]
    Product.create(
        title: item['name'],
        description: item['description'],
        quantity: 50,
        price: item['price'],
        quwan_goodsid: item['id'],
        page_idx: item['page_idx'],
        logo: item['logo'],
        brand: item['brand']
    )
end
puts '商品基本信息记录导入完成'

# goods_attr.json
json = File.read('./db/seedjson/goods_attr.json')
obj = JSON.parse(json)
count = obj['RECORDS'].count
puts "商品属性记录#{count}条导入中......"
for i in 0...count do
    item = obj['RECORDS'][i]
    GoodsAttr.create(
        quwan_goodsid: item['goods_id'],
        attr_name: item['attr_name'],
        attr_value: item['attr_value']
    )
end
puts '商品属性记录导入完成'

# goods_img.json
json = File.read('./db/seedjson/goods_img.json')
obj = JSON.parse(json)
count = obj['RECORDS'].count
puts "商品图片记录#{count}条导入中......"
for i in 0...count do
    item = obj['RECORDS'][i]
    GoodsImage.create(
        quwan_goodsid: item['goods_id'],
        img_type: item['pic_type'],
        url: item['url'],
        idx: item['idx']
    )
end
puts '商品图片记录导入完成'

# page_goods.json
json = File.read('./db/seedjson/page_goods.json')
obj = JSON.parse(json)
count = obj['RECORDS'].count
puts "商品页面索引记录#{count}条导入中......"
for i in 0...count do
    item = obj['RECORDS'][i]
    GoodsPage.create(
        quwan_goodsid: item['goods_id'],
        page_idx: item['page_id'],
        page_title: item['page_title']
    )
end
puts '商品页面索引记录导入完成'
