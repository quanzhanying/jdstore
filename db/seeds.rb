# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.new
u.email = "cooldian@126.com"
u.password = "123456"
u.password_confirmation = "123456"
u.is_admin = true
u.save

puts "1 admin account created"

create_account_user = User.create([email: "cooldeer@126.com", password: "123456", password_confirmation: "123456", is_admin: "false"])

puts "1 user account created"


p = Product.new
p.title = "燃气轮机全压全尺寸燃烧室的实验方法"
p.description = "本发明是一种燃气轮机燃烧室的实验方法,可以进行燃烧室的全压全尺寸实验。利用电厂现有燃气轮机,在燃气轮机的压缩机出口抽取压缩空气作为燃烧室实验用空气,完全实现燃气轮机燃烧室的实际工作状况,包括点火、启动、升负荷、降负荷及停机等过程。本发明的实验方法既可以提高燃烧室实验的可靠性,也大大减少燃气轮机燃烧室压缩机的投资与耗电。"
p.quantity = 1
p.price = 5000000
p.link_address = "http://www.soopat.com/Patent/200810118324"
p.save

p = Product.new
p.title = "燃气轮机合成气稀释扩散燃烧多喷嘴"
p.description = "本发明一种低污染物排放、低噪声的适用于合成气的多喷嘴稀释扩散燃烧系统。采用一个液体燃料喷雾燃烧喷嘴、五个旋向相同的合成气喷嘴的布置方式，可以进行稀释扩散燃烧。燃料旋流器和空气旋流器分别采用切向孔的形式和叶片式径向旋流器，两者之间的旋向相反。叶片选用背面开槽和开切向孔式的两种特殊结构。"
p.quantity = 1
p.price = 10000000
p.link_address = "http://www.soopat.com/Patent/200610150337?lx=FMSQ"
p.save

p = Product.new
p.title = "低浓度瓦斯气切换催化反应稳定运行的方法"
p.description = "本发明涉及能源利用和环境保护技术，是一种低浓度瓦斯气切换催化反应稳定运行的方法。使低浓度瓦斯气通过流向切换催化反应器发生催化燃烧反应，消耗甲烷同时产生热量，催化反应器工作稳定温度范围在200℃到600℃。本发明通过对反应器进口浓度和反应器温度的实时测量得到信号，信号输送到信号处理和控制系统，对比信号和优化反应运行参数，然后将控制信号发送到高浓度煤层气管路入口控制系统及高温换热器控制系统。当温度在正常运行范围内时，维持原来的运行。当温度偏离设计值时，如果温度偏高，控制强化高温换热器加强换热，从而降低反应器温度；如果浓度或温度偏低，打开煤矿中高浓度煤层气的阀门来维持燃料浓度而使得反应能够顺利进行。"
p.quantity = 1
p.price = 2000000
p.link_address = "http://www.soopat.com/Patent/200610165538?lx=FMSQ"
p.save

p = Product.new
p.title = "直线对焊热电偶及测量修正方法"
p.description = "一种直线对焊热电偶及测量修正方法，该热电偶由对焊偶丝、偶丝接 头、细钢管、支撑块、固定螺栓、弹簧和导线组成。两根细钢管通过固定 螺栓固定在支撑块上，其中一根钢管作为固定臂，其位置在测量时保持不 变，另一根钢管作为可动臂，可以自由活动；固定臂和可动臂的上端分别 装有偶丝接头，偶丝接头一端与穿过细钢管的导线相连；偶丝的两端分别 通过细螺钉固定在偶丝接头上；固定臂和可动臂的末端套有弹簧，通过弹 簧对可动臂位置的调节来消除偶丝的热膨胀造成的测量误差。用热电偶直 接测量火焰温度场存在很大的导热和辐射误差，而使用本发明的测量方法 和计算机修正程序对直线对焊热电偶的测量结果进行修正，可最大限度减 小测温过程中的误差。"
p.quantity = 1
p.price = 100000
p.link_address = "http://www.soopat.com/Patent/200710063370?lx=FMSQ"
p.save

p = Product.new
p.title = "用于汽车冷启动的甲醇/乙醇驻涡微燃烧器预热进气装置"
p.description = "本发明一种用于汽车冷启动的通过驻涡微燃烧器预热空气的辅助点火方法及装置，涉及内燃机技术。该方法是：通过少量甲醇/乙醇燃料在微燃烧器内的燃烧产生高温烟气，然后混合燃机进气，从而提高进入燃机空气的温度，解决甲醇/乙醇汽车的冷启动问题。该装置位于空气滤清器之后、空气进气歧管之前，装置包括驻涡微燃烧器、甲醇/乙醇预热蒸发器。液体甲醇/乙醇通过预热器的预热蒸发，在微燃烧器内和空气进行混合燃烧，产生的高温烟气和汽车进气的主气流混合。本发明通过提高进气温度来解决冷启动问题，装置简单，运行操作方便。"
p.quantity = 1
p.price = 1000000
p.link_address = "http://www.soopat.com/Patent/200610165540?lx=FMSQ"
p.save
