# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

if User.find_by(email: 'admin@gmail.com').nil?
  u = User.new
  u.email = 'admin@gmail.com' # 可以改成自己的 email
  u.password = '123456'                # 最少要六码
  u.password_confirmation = '123456'   # 最少要六码
  u.is_admin = true
  u.save
  puts '新建管理员'
else
  puts '该账户已创建，不重复增加'
end

if User.find_by(email: 'user@gmail.com').nil?
  v = User.new
  v.email = 'user@gmail.com'           # 可以改成自己的 email
  v.password = '123456'                # 最少要六码
  v.password_confirmation = '123456'   # 最少要六码
  v.is_admin = false
  v.save
  puts '新建普通用户'
else
  puts '该账户已创建，不重复增加'
end

if User.find_by(email: 'cltatest@126.com').nil?
  u = User.new
  u.email = 'cltatest@126.com'           # 可以改成自己的 email
  u.password = '12345687'                # 最少要六码
  u.password_confirmation = '12345687'   # 最少要六码
  u.is_admin = true
  u.save
  puts '新建管理员'
else
  puts '该账户已创建，不重复增加'
end

Product.create!(
  title: '圣经 ',
  description: 'The Holy Bible (King James Version)',
  price: 119,
  quantity: 5,
  image: open('http://jgospel.net/media/123369/.jpg')
)

Product.create!(
  title: '小王子',
  description: '小王子（纯美珍藏绘本）',
  price: 29,
  quantity: 6,
  image: open('https://upload.wikimedia.org/wikipedia/zh/thumb/0/05/Littleprince.JPG/220px-Littleprince.JPG')
)

Product.create!(
  title: '人类群星闪耀时',
  description: '茨威格从悠久的历史中撷取十四个重要时刻加以生动刻画，这些时刻——正如他在本书“序言”中所说——“对世世代代做出不可改变的决定；它决定着一个人的生死、决定着一个民族的存亡甚至整个人类的命运”。',
  price: 36,
  quantity: 10,
  image: open('https://img3.doubanio.com/lpic/s28104752.jpg')
)

Product.create!(title: '浪潮之巅',
                description: '这不是一本科技产业发展历史集，而是在这个数字时代，一本IT人非读不可，而非IT人也应该拜读的作品。 ',
                price: 99,
                quantity: 8,
                image: open('https://img3.doubanio.com/lpic/s27932441.jpg'))

Product.create!(title: '海边的卡夫卡',
                description: '小说描写一个15岁少年立志成为世界上坚韧的人，离家踏上“不重复第二遍”的旅途，由此遇上一系列奇人奇事。',
                price: 49,
                quantity: 10,
                image: open('http://pic.pimg.tw/lovetabris/1184031969.jpg'))

Product.create!(title: '无声告白',
                description: '我们终此一生，就是要摆脱他人的期待，找到真正的自己。',
                price: 26,
                quantity: 5,
                image: open('https://img3.doubanio.com/lpic/s28109182.jpg'))
