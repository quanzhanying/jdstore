Rails.application.routes.draw do
  root "products#index"

    devise_for :users

  resources :orders do
    member do
      post :pay_with_wechat
      post :pay_with_alipay
      post :cancel
    end
  end

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

        resources :orders do
          member do
            post :cancel
            post :ship
          end
        end
  end


  resources :products do
    member do
      post :add_to_cart
    end
  end
  root 'products#index'


  resources :carts do
    collection do
      post :checkout
    end

    member do
      post :delete_one_item
    end
  end

  resources :cart_items do
    member do
      post :add_an_item
      post :minus_an_item
    end
  end

  namespace :account do
    resources :orders
  end


end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.h
