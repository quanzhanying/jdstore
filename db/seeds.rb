u = User.new
u.email = "11@11.com"

u.password = "123456"

u.password_confirmation = "123456"

u.is_admin = true
u.save
