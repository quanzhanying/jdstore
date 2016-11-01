Rails.application.routes.draw do


  devise_for :users

  resources :carts do
    collection do
      post :checkout
    end
  end

  resources :orders do
    method do
      post :pay_with_wechat
      post :pay_with_alipay
    end
  end

  resources :cart_items do
    member do
      post :add_quantity
      post :reduce_quantity
    end
  end

  resources :products do
    member do
      post :add_to_cart
      post :hide
      post :publish
    end
  end

  namespace :admin do

    resources :users do
      member do
        post :administrator
        post :consumer
      end
    end

      resources :products do
        member do
          post :hide
          post :publish
        end
      end

    end

    resources :products

    #resources :welcome

  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
