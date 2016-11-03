Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :cart_items do
    member do
      post :increase
      post :decrease
    end
  end
  resources :carts do
    collection do
      post :checkout
    end
  end

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
    end
  end

  namespace :account do
    resources :orders do
      member do
        post :pay_with_alipay
        post :pay_with_wechat
        post :cancell_order
      end
    end
  end

  namespace :admin do
    resources :orders do
      member do
        post :pay_with_alipay
        post :pay_with_wechat
        post :cancell_order
        post :ship
      end
    end
    resources :users do
      member do
        post :become_admin
        post :become_user
      end
    end
    resources :products do
      member do
        post :onsale
        post :soldout
      end
    end
  end


  root 'products#index'
end
