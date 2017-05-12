u = User.new
u.email = "dadan_2007@126.com"           # 可以改成自己的 email

u.password = "123456"

u.password_confirmation = "123456"

u.is_admin = true
u.save
