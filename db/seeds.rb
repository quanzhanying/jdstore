User.create!([
  {email: "admin@test.com", encrypted_password: "$2a$11$pQbG/.qBLrYonEthRSE6oOyIhbt7KA4h03Cta.APlnA.jo16GeVLe", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-02-26 14:37:02", last_sign_in_at: "2017-02-26 14:37:02", current_sign_in_ip: "::1", last_sign_in_ip: "::1", is_admin: true}
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
