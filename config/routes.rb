Rails.application.routes.draw do
  # resources :comments
  resources :brands
  resources :categories
  devise_for :users, controllers:
   { sessions: 'users/sessions',
     registrations: 'users/registrations', :passwords => "users/passwords" } #客服系统相关
  resources :carts do
    collection do
      delete :clean
      post :checkout
      get :checkout
    end
  end
  resources :cart_items do
    member do
      post :increase
      post :decrease
    end
  end
  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end
  resources :products do
    resources :comments #商品评论的路径
    member do
      post :buy_now #立即购买路径
      post :add_to_cart
      post :add_to_favorite  #收藏商品功能
      post :cancel_favorite  #取消收藏功能
      put "like", to: "products#upvote"  #点赞功能
    end
    collection do
      get :search
    end
  end
  namespace :admin do
    resources :products
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
  end
  namespace :account do
   resources :users #新增“我的账户”的相关路径
   resources :orders
   resources :products
  end
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
