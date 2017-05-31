
if User.where(:email => "admin@test.com").all.count == 0
  User.create("email"=>"admin@test.com", "is_admin"=>true, "password"=>"111111", "password_confirmation"=>"111111")
end
