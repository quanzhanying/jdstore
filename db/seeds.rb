
if User.where(:email => "admin@test.com").all.count == 0
  User.create("email"=>"admin@test.com", "is_admin"=>true, "password"=>"111111", "password_confirmation"=>"111111")
end

for i in 1..10 do
  Product.create("title"=>"飞傲（FiiO）i1 苹果闪电接口耳放", "description"=>"飞傲（FiiO）i1 苹果闪电接口耳放", "price"=>100, "quantity"=>20, "image"=>"http://oqex30cqv.bkt.clouddn.com/uploads/product/image/4/5.png", "category"=>"寝居玩具")
end

puts "10 products created!"

ProductCategory.create("name"=>"婴幼儿服饰")
ProductCategory.create("name"=>"儿童服饰")
ProductCategory.create("name"=>"配搭")
ProductCategory.create("name"=>"妈咪")
ProductCategory.create("name"=>"寝居玩具")
ProductCategory.create("name"=>"婴童")
ProductCategory.create("name"=>"喂养")

puts "product catetoy created!"
