u = User.new
u.email = "admin@test.com"           # 可以改成自己的 email

u.password = "000000"                # 最少要六码

u.password_confirmation = "000000"   # 最少要六码

u.is_admin = true
u.save
