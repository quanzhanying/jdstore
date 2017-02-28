# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create!([
  {title: "限量版玩具熊", description: "羊绒外套，埃及棉填充，谁的童年不缺玩具？", quantity: 5, price: 999},
  {title: "限量版澡盆", description: "室内室外均可以使用，孩子自己洗，自己玩，另附赠小号水杯一个", quantity: 10, price: 399},
  {title: "婴儿床", description: "纯手工天然藤条编制，真丝床帏、遮阳顶棚，透气防晒，另有配套床上用品出售。", quantity: 15, price: 3299},
  {title: "儿童套衣", description: "含羊绒帽子一顶，外衣一件，裤子一条。小小男子汉再也不怕奶奶风或者姥姥风了。",
    quantity: 24, price: 569,},
  {title: "纯天然黍米圈", description: "牛奶的情人，孩子们的爱人。不含糖，有多种口味，有时候， 孩子不爱吃早餐，是早餐的错。",
     quantity: 1999,price: 99},
  {title: "限量版脚踏车", description: "F1法拉利车队首席设计师设计，防震性能出色，配色经典怀旧，向第一代法拉利赛车致敬。飞驰吧，少年。 请在成年人看护下使用", quantity: 10, price: 30999}
])


puts "create products"

u = User.create([ email: 'wiltonwung@gmail.com' ,  password: '1982610' ,password_confirmation:'1982610',is_admin:true])
puts "create a adminer"
