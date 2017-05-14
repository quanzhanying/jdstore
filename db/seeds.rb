# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


u = User.new
u.email = "admin@test.com"           # 可以改成自己的 email

u.password = "123456"                # 最少要六码

u.password_confirmation = "123456"   # 最少要六码

u.is_admin = true
u.save

rails g model classfication_pri title:string description:text
rails g model classfication_sub title:string description:text classfication_pri_id:integer

ClassficationPri.create([title:"潜水装备",description:"潜水用的东西"])
ClassficationPri.create([title:"特色商品",description:"旅游中买到的各地特设商品"])
ClassficationPri.create([title:"旅游项目",description:"以个人、带团的形式，组织旅游项目"])

ClassficationSub.create([title:"船宿",description:"在船上食宿、潜水",classfication_pri_id:"1"])
ClassficationSub.create([title:"潜水",description:"浮潜、OW、AOW",classfication_pri_id:"1"])
ClassficationSub.create([title:"服装",description:"潜水服装",classfication_pri_id:"2"])
ClassficationSub.create([title:"用具",description:"潜水用具",classfication_pri_id:"2"])
ClassficationSub.create([title:"玩偶",description:"各地特色的小玩偶",classfication_pri_id:"3"])
ClassficationSub.create([title:"纪念品",description:"各地特色的纪念品",classfication_pri_id:"3"])
