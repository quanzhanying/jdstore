Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "products#index"
  resources :products do
    member do
      post :add_to_cart
    end
  end

  namespace :stores do
    resources :products
  end

  resources :stores

  resources :carts do
    member do
      delete 'delete_item'
      patch 'change_quantity'
    end

    collection do
      post :checkout
    end
  end

  resources :orders do
    member do
      post :pay_with_wechat
      post :pay_with_alipay
      post :pay_with_alipay_or_wechat
    end
  end

  namespace :account do
    resources :orders
  end
end
