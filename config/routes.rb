Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :carts do
    member do
      post :remove_all_item_from_cart
    end

    collection do
      post :checkout
    end
  end

  resources :orders

  resources :items do
    member do
      post :add_to_cart
      put :remove_from_cart
    end
  end

  namespace :admin do

    resources :orders

  	resources :items

    resources :users do
      member do
        post :change_to_admin
        post :change_to_customer
      end
    end

  end

  namespace :customer do

    resources :orders do
      member do
        post :pay_with_alipay
        post :pay_with_wechat
      end
    end

  	resources :favorites do

      member do
        post :addToFavorites
        put :removeFromFavorites
      end
      
    end

  end

  root "items#index"
  
end
