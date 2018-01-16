Rails.application.routes.draw do
  resources :comments
  devise_for :users, controllers: {sessions:'users/sessions',registrations:'users/registrations'}

  root 'welcome#index'
  #---管理员专区---#
  namespace :admin do
    # 产品 ＃
    resources :products do
      member do
        patch :move_up
        patch :move_down
      end
    end

    #订单管理 #
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end

    #分类＃
    resources :categories

  end

  resources :products do
    member do
      post :add_to_cart
      post :like
      post :unlike
    end
    # 搜索 ＃
    collection do
      get :search
    end
    # 评论 ＃
    resources :comments
  end

  resources :carts do
    collection do
      delete :clean
        post :checkout
    end
  end

  resources :cart_items do
    member do
      # 购物车中使用 ＋和－按钮改变购物数量 ＃
      post :add_quantity
      post :remove_quantity
    end
  end

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

  namespace :account do
    resources :orders
    resources :favorites
  end


end
