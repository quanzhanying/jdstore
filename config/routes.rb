Rails.application.routes.draw do
  devise_for :users
  resources :carts do
    collection do
      post :checkout
    end
  end
  resources :cart_items
  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
    end
  end
  resources :products do
    member do
      post :add_to_cart
    end
  end
  namespace :admin do
    resources :products
  end
  namespace :account do
   resources :orders
  end
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
