Rails.application.routes.draw do
  devise_for :users

  namespace :admin  do
    resources :products
    resources :orders
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts do
    collection do
      post :checkout
    end
    member do
      delete :clear
    end
  end

  resources :cart_items do
    member do
      post :add_quantity
      post :minus_quantity
    end
  end

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
    end
  end

  namespace :account do
    resources :orders
  end
  root "products#index"

end
