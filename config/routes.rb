Rails.application.routes.draw do

  devise_for :users


  namespace :admin do
    resources :products do     #后台上架网址 admin/products
      member do
        patch :move_up         #商品位置移动
        patch :move_down       #商品位置移动
      end
    end
    resources :orders do       #管理员查看订单
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
    resources :courses do        #后台上架课程 admin/courses
      member do
        patch :move_up           #课程位置移动
        patch :move_down         #课程位置移动
      end
    end
    resources :articles do       #文章后台
      member do
        patch :move_up           #文章位置移动
        patch :move_down         #文章位置移动
        post :publish
        post :hide
      end
    end
  end

  resources :products do      #前台product
    member do
      post :add_to_cart       #加入购物车
      post :join              #加入收藏
      post :quit              #取消收藏
    end
    collection do
      get :search             #搜索功能
      get :accept             #分类 收纳品
      get :decoration         #分类 装饰品
      get :course             #分类 课程
    end
    resources :reviews
  end

  resources :courses do         #前台显示课程
    member do
      post :add_to_cart
      post :instant_buy
    end
  end

  resources :carts do         #购物车明细
    collection do
      delete :clean           #清空购物车
      post :checkout          #提交订单
    end
  end

  resources :cart_items       #购物车列表

  resources :orders do        #商品订单
    member do
      post :pay_whit_alipay   #支付宝支付
      post :pay_whit_wechat   #微信支付
      post :apply_to_cancel   #用户申请撤销订单
    end
  end

  resources :course_orders do        #课程订单
    member do
      post :pay_whit_alipay   #支付宝支付
      post :pay_whit_wechat   #微信支付
      post :apply_to_cancel   #用户申请撤销订单
    end
  end

  namespace :account do
    resources :orders          #用户后台查看订单
    resources :collections     #用户收藏
    resources :users           #用户编辑个人信息
  end

  resources :articles         #文章前台

  get "about/index"

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
