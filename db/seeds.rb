u = User.new
u.email = "admin@test.com"

u.password = "123456"

u.password_confirmation = "123456"

u.is_admin = true
u.save
