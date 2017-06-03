
if User.where(:email => "admin@test.com").all.count == 0
  User.create("email"=>"admin@test.com", "is_admin"=>true, "password"=>"111111", "password_confirmation"=>"111111")
end

products_info = [
 {title: 'a', catetoy: "婴幼儿服饰", description: '4',image: 'https://images-na.ssl-images-amazon.com/images/I/41zHTkGM4mL._SX200_QL80_.jpg'},
 {title: 'b', catetoy: "儿童服饰", description: '3',image: 'https://images-na.ssl-images-amazon.com/images/I/41zHTkGM4mL._SX200_QL80_.jpg'},
 {title: 'c', catetoy: "配搭", description: '2',image: 'https://images-na.ssl-images-amazon.com/images/I/41zHTkGM4mL._SX200_QL80_.jpg'},
 {title: 'd', catetoy: "妈咪", description: '1',image: 'https://images-na.ssl-images-amazon.com/images/I/41zHTkGM4mL._SX200_QL80_.jpg'},
 {title: 'e', catetoy: "寝居玩具", description: '1',image: 'https://images-na.ssl-images-amazon.com/images/I/41zHTkGM4mL._SX200_QL80_.jpg'},
 {title: 'f', catetoy: "婴童", description: '1',image: 'https://images-na.ssl-images-amazon.com/images/I/41zHTkGM4mL._SX200_QL80_.jpg'},
 {title: 'g', catetoy: "喂养", description: '1',image: 'https://images-na.ssl-images-amazon.com/images/I/41zHTkGM4mL._SX200_QL80_.jpg'},
]

products_info.each do |info|
	 Product.create!(
		 title: info[:title],
     category: info[:catetoy],
		 description: info[:description],
		 quantity: rand(5..6),
		 price: rand(5..6),
		 image: open(info[:image])
		 )
 end

ProductCategory.create("name"=>"婴幼儿服饰")
ProductCategory.create("name"=>"儿童服饰")
ProductCategory.create("name"=>"配搭")
ProductCategory.create("name"=>"妈咪")
ProductCategory.create("name"=>"寝居玩具")
ProductCategory.create("name"=>"婴童")
ProductCategory.create("name"=>"喂养")

puts "product catetoy created!"
