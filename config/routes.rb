Rails.application.routes.draw do
  # resources :carts
  resources :orders do
    member do
      post:pay_with_alipay
      post:pay_with_wechat
    end
  end 

  resources :carts do
    collection do
      post :checkout
    end
  end

  devise_for :users

  namespace :admin do
    resources :products
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  root 'products#index' # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
