Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :products
    resources :orders do
      member do
        post :cancel
        post :ship
      end
    end
  end

  resources :carts do
    collection do
      delete :delete_all
      post :checkout
    end
    member do
      post :number_up
      post :number_down
    end
    resources :cart_item
  end

  resources :products do
    member do
      post :join
      post :quit
      post :add_to_cart
    end
    resources :posts
  end

  resources :orders do
    member do
      post :pay_with_wechat
      post :pay_with_alipay
    end
  end

  namespace :account do
    resources :products
    resources :orders do
      member do
        post :cancel
      end
    end
  end



  root 'products#index'

end
