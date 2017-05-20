# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.find_by(email: "admin@test.com").nil?
  u = User.new
  u.email = "hj@gmail.com"           # 可以改成自己的 email
  u.password = "123456"                # 最少要六码
  u.password_confirmation = "123456"   # 最少要六码
  u.is_admin = true
  u.save
  puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
else
  puts "Admin 已经建立过了，脚本跳过该步骤。"
end

# Initialize Product
#
Product.create!(title: "glass",
  description: "眼镜",
  price: 2800,
  quantity: 5,
  image: open("http://oq3bof327.bkt.clouddn.com/3d_glasses_movie_entertainment_cinema_video_film_theater_retro_tv_analog_watching_media_device_technology_watching_flat_design_icon-512.png")
  )

Product.create!(title: "camera",
  description: "摄像机",
  price: 5000,
  quantity: 5,
  image: open("http://oq3bof327.bkt.clouddn.com/classica_movie-camera_flat-circle-white-on-black_512x512.png")
  )
