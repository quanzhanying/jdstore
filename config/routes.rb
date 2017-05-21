Rails.application.routes.draw do
  namespace :admin do
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
      delete :clean
      post :checkout
    end
  end

  resources :cart_items
  resources :orders do
    member do
      post :pay_with_wechat
      post :pay_with_alipay
    end
  end

  namespace :account do
    resources :orders
  end

  devise_for :users
  root 'products#index'
end
