u = User.new
u.email = "122380981@qq.com"           # 可以改成自己的 email

u.password = "111111"                # 最少要六码

u.password_confirmation = "111111"   # 最少要六码

u.is_admin = true
u.save
