Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :products
  end

  resources :products do
    member do
      post :add_to_cart
    end
    resources :cart_items
  end

  resources :carts do
    resources :cart_items
    collection do
      post :checkout
    end
  end

  resources :cart_items do
    member do
      post :add_amount
      post :subtract_amount
    end
  end

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :pay_with_apple
    end
  end

  root 'products#index'
  
end
