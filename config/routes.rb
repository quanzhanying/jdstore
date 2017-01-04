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
      post :cancell_order
      post :ship
    end
  end

  namespace :account do
    resources :orders do
      member do
        post :apply_for_cancell
      end
    end
  end

  root "products#index"

end
