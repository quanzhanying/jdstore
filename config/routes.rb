Rails.application.routes.draw do
  root 'products#index'
  devise_for :users
  namespace :admin do
    resources :products
  end
  resources :products do
    member do
      post :add_to_cart
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :carts do
    collection do
      delete :clean
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
  namespace :account do
    resources :orders
  end
end
