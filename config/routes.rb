Rails.application.routes.draw do

  devise_for :users

  namespace :admin do
    resources :products do
      member do
        post :publish
        post :hide
      end
    end
    resources :users do
      member do
        post :admin
        post :user
      end
    end
    resources :orders
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :users

  resources :carts do
      collection do
      post :checkout
      delete :destroy
    end
  end


  resources :cart_items do
    member do
      post :up_cart_item
      post :down_cart_item
    end
  end

  resources :orders do
    member do
      post :pay_with_wechat
      post :pay_with_alipay
    end
  end

  namespace :account do
    resources :orders
    resources :product_lists
  end
  
  root 'products#index'

end
