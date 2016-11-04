Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :users do
      member do
        post :master
        post :guest
      end
    end
    resources :products
  end

  resources :products do
    member do
      post :add_to_cart
      post :bought
    end
  end

  resources :carts do
    collection do
      post :destroy_cart
      post :checkout
    end
    resources :products
  end
  resources :cart_items
  resources :orders do
    member do
      post :pay_with_wechat_wechat
      post :pay_with_alipay
    end
  end 
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
