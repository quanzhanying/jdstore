# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.new
u.email = "admin@test.com"
u.password = "123456"
u.password_confirmation = "123456"
u.is_admin = true
u.save

Category.create(name: "铁道部")
Category.create(name: "运输部")

# Size.create(name: "判断题")
# Size.create(name: "选择题")
# Size.create(name: "识图题")
create_exams =
  Exam.create!([name: "1", question: "中国有多少个省份？",answer_1:"36", answer_2:"35",answer_3:"34",answer_4:"33" ,
    category_id: 1, is_a1en: true ,is_b1en: false,is_c1en: false,is_d1en: false,countdown:"2017-05-31T00:30"])

  create_exams =
    Exam.create!([name: "2", question: "中国有多少个民族？",answer_1:"48", answer_2:"35",answer_3:"34",answer_4:"56",
      category_id: 2, is_a1en: false ,is_b1en: false,is_c1en: false,is_d1en: true,countdown:"2017-05-31T00:30"])
