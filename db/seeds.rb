User.create!([
  {email: "a@b.c", encrypted_password: "$2a$11$h/0s0Y6ZNP1Kp4nM4sBSYe0duhbLVX45GzLM6fyUT2Iq78M6N/uW2", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 17, current_sign_in_at: "2017-02-06 22:56:19", last_sign_in_at: "2017-01-29 18:03:23", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", is_admin: true},
  {email: "b@b.c", encrypted_password: "$2a$11$Momeb82u4K8woYhi1T8w2uuURktEGSM25DmD93S6aZnIu7Wp2MhsW", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2017-01-29 18:02:42", last_sign_in_at: "2017-01-29 17:53:41", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", is_admin: false}
])
Cart.create!([
  {}
])
CartItem.create!([
  {cart_id: nil, product_id: 4, quantity: 1},
  {cart_id: nil, product_id: 4, quantity: 1},
  {cart_id: nil, product_id: 4, quantity: 1},
  {cart_id: nil, product_id: 3, quantity: 1},
  {cart_id: nil, product_id: 2, quantity: 1},
  {cart_id: nil, product_id: 5, quantity: 1},
  {cart_id: nil, product_id: 2, quantity: 1},
  {cart_id: nil, product_id: 2, quantity: 1},
  {cart_id: 1, product_id: 5, quantity: 5},
  {cart_id: 1, product_id: 2, quantity: 4}
])
Product.create!([
  {title: "Bose headset", description: "Nice to flow", quantity: 4, price: 300, image: "Bose_qc35.jpg"},
  {title: "Aeron Herman Miller Chair", description: "The best chair for Coders.", quantity: 100, price: 980, image: "aeron.jpg"}
])
