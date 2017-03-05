User.create!([
  {email: "admin@test.com", password: "123456",  is_admin: true}
])
Cart.create!([
  {}
])
Category.create!([
  {name: "爬行"},
  {name: "昆虫"},
  {name: "水族"},
  {name: "造景"},
  {name: "器材"}
])
Product.create!([
  {title: "1", description: "1", quantity: 1, price: 1, image: nil, category_id: 4},
  {title: "3", description: "3", quantity: 3, price: 3, image: nil, category_id: 1},
  {title: "3", description: "3", quantity: 3, price: 3, image: nil, category_id: 5}
])
