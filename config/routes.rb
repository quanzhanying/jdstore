Rails.application.routes.draw do


  devise_for :users

  namespace :account do
    resources :orders
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
      put :cancell_order
      put :deliver
      put :return_good

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

      resources :orders do
        member do
          put :ship
          put :cancell_order
        end
      end
    end

    resources :products

    #resources :welcome

  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
