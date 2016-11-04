Rails.application.routes.draw do
  devise_for :users

  resources :products do
    member do
      post :add_to_cart
    end
  end

  namespace :admin do
    resources :products
    resources :orders
  end

  resources :carts do
    collection do
      post :checkout
    end
  end

  resources :cart_items do
    member do
      post :add
      post :minus
    end
  end

  resources :orders do
    member do
      post :pay_with_wechat
      post :pay_with_alipay
      post :cancell
      post :shipping
      post :shipped
    end
  end

  namespace :account do
    resources :orders do
    member do
    post :cancell
    end
  end
end

  root 'products#index'
end
