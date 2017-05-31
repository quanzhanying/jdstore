Rails.application.routes.draw do
  devise_for :users
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
    resources :categories do
    end
  end

  resources :products do
    member do
      post :add_to_cart
    end
    # 搜索 ＃
    collection do
      get :search
    end
  end

  resources :carts do
    collection do
      delete :clean
        post :checkout
    end
  end

  resources :cart_items

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

  namespace :account do
    resources :orders
  end


end
