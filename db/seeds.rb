if User.find_by(email: "122380981@qq.com").nil?
  u = User.new
  u.email = "122380981@qq.com"           # 可以改成自己的 email
  u.password = "111111"                # 最少要六码
  u.password_confirmation = "111111"   # 最少要六码
  u.is_admin = true

  u.save
  puts "Admin 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
else
  puts "Admin 已经建立过了，脚本跳过该步骤。"
end
#   f_title = [
#     "北京烤鸭",
#     "大闸蟹",
#     "东坡肉",
#     "剁椒鱼头",
#     "法式鸡公煲",
#     "宫保鸡丁",
#     "锅包肉",
#     "过桥米线",
#     "煎饼果子",
#     "麻辣香锅",
#     "墨西哥肉卷",
#     "三明治",
#     "三文鱼扒 ",
#     "水煮鱼",
#     "小笼包",
#     "红烧肉"
#   ]
# f_images = [
#   "http://ww4.sinaimg.cn/large/006tNbRwgy1ffrq4hl3blj30rs0jqdjg.jpg",
#   "http://ww2.sinaimg.cn/large/006tNbRwgy1ffrqa6g8lbj30i80r540z.jpg",
#   "http://ww4.sinaimg.cn/large/006tNbRwgy1ffrqaet2crj308c0693yt.jpg",
#   "http://ww3.sinaimg.cn/large/006tNbRwgy1ffrqalyuc6j30dw09bgm7.jpg",
#   "http://ww3.sinaimg.cn/large/006tNbRwgy1ffrqarbpb1j30dc06odgw.jpg",
#   "http://ww4.sinaimg.cn/large/006tNbRwgy1ffrqb1t147j30r80kfdkw.jpg",
#   "http://ww2.sinaimg.cn/large/006tNbRwgy1ffrqb83ynaj30hs0a3diy.jpg",
#   "http://ww4.sinaimg.cn/large/006tNbRwgy1ffrqbeb3lgj30b408ctd5.jpg",
#   "http://ww4.sinaimg.cn/large/006tNbRwgy1ffrqbtofakj30c807sdgi.jpg",
#   "http://ww3.sinaimg.cn/large/006tNbRwgy1ffrqceyovbj30m80etgx2.jpg",
#   "http://ww1.sinaimg.cn/large/006tNbRwgy1ffrqcrtif5j30h40cu75f.jpg",
#   "http://ww1.sinaimg.cn/large/006tNbRwgy1ffrqd72vprj30p00e2my3.jpg",
#   "http://ww3.sinaimg.cn/large/006tNbRwgy1ffrqdgbtptj30ec09k42j.jpg",
#   "http://ww4.sinaimg.cn/large/006tNbRwgy1ffrqdo4poej30dw099wfq.jpg",
#   "http://ww1.sinaimg.cn/large/006tNbRwgy1ffrqe008olj30le0c8q9k.jpg",
#   "http://ww4.sinaimg.cn/large/006tNbRwgy1ffrqbloodsj30p00gowj0.jpg",
# ]
#     for i in 0..15 do
#       Product.create!(
#       title: f_title[i],
#       description:"这只是底料，请去实验室DIY！",
#       quantity:rand(6..10),
#       price:rand(50..100)*10,
#       image: open(f_images[i]),
#       )
#
#       puts i
#     end
