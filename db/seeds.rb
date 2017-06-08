u = User.new
u.email = "scarletttang89@163.com"           # 可以改成自己的 email

u.password = "111111"

u.password_confirmation = "111111"

u.is_admin = true
u.save

# Initialize Product

  Product.create!(title: "再别康桥",
    description: "再别康桥",
    price: 199,
    quantity: 5,
    image: open("http://www.tourzj.com/uploadfile/imgupload/8a695b72-bbbd-4252-9cba-4d98f20d680d.jpg")
    )
