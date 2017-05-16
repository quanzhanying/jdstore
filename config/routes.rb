Rails.application.routes.draw do

  devise_for :users


  namespace :admin do
    resources :products do     #后台上架网址 admin/products
      member do
        patch :move_up         #商品位置移动
        patch :move_down       #商品位置移动
      end
    end
  end

  resources :products do      #前台product
    member do
      post :add_to_cart
    end
  end

  resources :carts do         #购物车明细
    collection do
      delete :clean           #清空购物车
      post :checkout          #提交订单
    end
  end

  resources :cart_items       #购物车列表

  resources :orders           #订单

  namespace :account do
    resources :orders          #用户后台查看订单
  end


  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
