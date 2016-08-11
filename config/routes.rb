Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  resources :products do
    member do
      post :add_to_cart
    end
  end

  namespace :admin do
    resources :products
    resources :orders
    resources :usertypes do
      member do
        post :set_admin
        post :set_user
      end
    end
  end

  resources :carts do
    member do
      post :up_product
      post :down_product
    end
  end

  resources :cart_items

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
    end
  end

  namespace :account do
    resources :orders do
      member do
        post :request_to_cancel
      end
    end
  end
end
