# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.find_by(email: "449245472@qq.com").nil?
    u = User.new
    u.email = "449245472@qq.com"           # 可以改成自己的 email
    u.password = "898989"                # 最少要六码
    u.password_confirmation = "898989"   # 最少要六码
    u.is_admin = true
    u.save
    puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
  else
    puts "Admin 已经建立过了，脚本跳过该步骤。"
  end
