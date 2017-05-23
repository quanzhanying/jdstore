# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


u = User.new
u.email = "nihao@163.com"           # 可以改成自己的 email

u.password = "123456"                # 最少要六码

u.password_confirmation = "123456"   # 最少要六码

u.is_admin = true
u.save
 # Initialize Admin User
  if User.find_by(email: "nihao@163.com").nil?
    u = User.new
    u.email = "nihao@163.com"           # 可以改成自己的 email
    u.password = "123456"                # 最少要六码
    u.password_confirmation = "123456"   # 最少要六码
    u.is_admin = true
    u.save
    puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
  else
    puts "Admin 已经建立过了，脚本跳过该步骤。"
  end


 # Initialize Product



  Product.create!(title: "wine1",
    description: "酒1",
    price: 2800,
    quantity: 5,
    image: open("http://a3.qpic.cn/psb?/V13Obk462MXIb5/KFP4r2Inc1xsgrr12.u*3VPj63I1KpTIsrkzj3iy2SE!/b/dGoBAAAAAAAA&bo=gALgAQAAAAARAFQ!&rf=viewer_4")
    )

  Product.create!(title: "wine2",
    description: "酒2",
    price: 2800,
    quantity: 5,
    image: open("http://a3.qpic.cn/psb?/V13Obk462MXIb5/P193lLp8BAu*5UO7NA9madSa1Kge8cvmXu6sNH4FOnM!/b/dGoBAAAAAAAA&bo=qgGAAgAAAAARAB4!&rf=viewer_4")
    )

  Product.create!(title: "wine3",
    description: "酒3",
    price: 2800,
    quantity: 5,
    image: open("http://a1.qpic.cn/psb?/V13Obk462MXIb5/C11DRgZZ2gvRga80SSOckE6sIgblvX2UAry9aFkwzm8!/b/dGsBAAAAAAAA&bo=QAGAAgAAAAADAOY!&rf=viewer_4")
    )

  Product.create!(title: "wine4",
    description: "酒4",
    price: 2800,
    quantity: 5,
    image: open("http://a3.qpic.cn/psb?/V13Obk462MXIb5/B3RNIVjOVS87PrIlp5TdWOQXOJd6uz4ZX2cnLy1V3UY!/b/dGoBAAAAAAAA&bo=gALgAQAAAAARAFQ!&rf=viewer_4")
    )

  Product.create!(title: "wine5",
    description: "酒5",
    price: 2800,
    quantity: 5,
    image: open("http://a1.qpic.cn/psb?/V13Obk462MXIb5/Nk082NBrLnAmxChkQ4H*eWpqzHDdO0cNsosDfMurXfM!/b/dGsBAAAAAAAA&bo=4AGAAgAAAAARAFQ!&rf=viewer_4")
    )

  Product.create!(title: "wine6",
    description: "酒6",
    price: 2800,
    quantity: 5,
    image: open("http://a1.qpic.cn/psb?/V13Obk462MXIb5/3XZzoQPcWEx2oFCxUrnQbOTlmLO7nnhib9*aP287uMc!/b/dGsBAAAAAAAA&bo=qwGAAgAAAAARAB8!&rf=viewer_4")
    )

  Product.create!(title: "wine7",
    description: "酒7",
    price: 2800,
    quantity: 5,
    image: open("http://a1.qpic.cn/psb?/V13Obk462MXIb5/ALlE8uVSPRxmW51FwsUEnTXhNFeHI0JUzxVdJpDcUHc!/b/dGsBAAAAAAAA&bo=qQGAAgAAAAARAB0!&rf=viewer_4")
    )

  Product.create!(title: "wine8",
    description: "酒8",
    price: 2800,
    quantity: 5,
    image: open("http://a1.qpic.cn/psb?/V13Obk462MXIb5/3XZzoQPcWEx2oFCxUrnQbOTlmLO7nnhib9*aP287uMc!/b/dGsBAAAAAAAA&bo=qwGAAgAAAAARAB8!&rf=viewer_4")
    )
