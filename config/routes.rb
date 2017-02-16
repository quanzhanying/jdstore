Rails.application.routes.draw do
  devise_for :users
  resources :products do
    member do
      post :add_to_cart
      post :favorite
      post :unfavorite
    end
    collection do
      get :search
    end
    resources :reviews, only: [:new, :create]
  end

  namespace :admin do
    resources :products
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
      post :pay_with_alipay
      post :pay_with_wechat
    end
  end

  namespace :account do
    resources :orders
  end

  resources :categories

  resources :favorites

  root "welcome#index"
end
