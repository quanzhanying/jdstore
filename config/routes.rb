Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :products
    resources :users do
      member do
        post :user
        post :admin
      end
    end
  end

  delete 'carts', to: 'carts#destroy'

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts do
    collection do
      post :checkout
    end
  end

  resources :orders do
    member do
      post :pay_with_wechat
      post :pay_with_alipay
      post :cancel
      post :ship

    end
  end

  namespace :account do
    resources :orders do
      member do
        post :return_good
        post :deliver
      end
    end
  end

  namespace :admin do
    resources :orders do
      member do
        post :ship
        post :cancel
        post :deliver
        post :return
      end
    end
  end

  resources :cart_items
  root 'products#index'
end
