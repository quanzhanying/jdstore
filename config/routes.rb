Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/recommend/', to:'products#recommend'

  namespace :admin do
    resources :products do
      member do
        post :move_up
        post :move_down
      end
    end

    resources :categories do
      resources :product do
        member do
          post :move_up
          post :move_down
        end
      end
    end

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
    resources :users #用户中心的相关路径
    resources :orders
  end

  resources :products do
    resources :reviews

    member do
      post :add_to_cart
      post :favorite
      post :unfavorite
      post :instant_buy
    end

    collection do
      get :search
    end
  end

  resources :carts do
    collection do
      delete :clean
      post   :checkout
    end
  end

  resources :cart_items do
    member do
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

  



  resources :favorites

end
