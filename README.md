# README


version 1.0 - EPIC-1  create at 2017-1-28
1.套上bootstrap
2.装上devise
3.套上simple_form
4.可以登入登出


version 1.1-EPIC-2 create at 2017-1-29
1.身为管理者，我要能够登入后台上架商品 (这时候还不需要设计权限问题）
2.后台上架网址必须要是 /admin/products

version 1.2-EPIC-3 create at 2017-2-2
1.身为商家的管理者，我要能够在后台设定权限，权限分成管理者以及消费者
2.身为管理者，才可以进入后台
3.身为管理者，必须要登入且是 admin
4.身为管理者，必须要登入
5.能登入后台的使用者必须可以是admin
6.管理者身份必须要被分为 admin / user

version 1.4-EPIC-4 create at 2017-2-2
1.身为管理者，我要能够登入后台
2.全站分为两种权限：admin (商家) / user （消费者）
3.商家可以登入 /admin
4.身为管理者，我要能够登入后台上架商品
4.后台上架网址必须要是 /admin/products
5.商品的内容分为物品标题、敘述、价格、库存
6.商品要能够设定是否能上架贩售
7.商品必须要有商品图片

version 1.5-EPIC-5 create at 2017-2-7
购物车设计
1.加入购物车
2.购物车显示所有已选的产品
3.显示购物车产品总价


version 1.6-EPIC-6 create at 2017-2-7
购物车逻辑判断
1.一键清空购物车内所有的物品
2.删除购物车内物品
3.已经加入购物车的物品，不能重复被加入
4.可以更改购物车内购买的数量（原本预设数量是1）
5.库存为0的货品不能购买
6.在购物车新增数量时，不能更新超过原有库存的数量

version 1.7-EPIC-7 create at 2017-2-7
制作订单明细页
可以填写寄送资讯
订单明细页
订单明细页网址必须秘密

verision 1.8-EPIC-8 create at 2017-2-11
定制devise页面
