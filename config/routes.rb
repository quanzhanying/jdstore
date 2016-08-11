Rails.application.routes.draw do

   devise_for :users
   root 'products#index'

   resources :products do
      member do
        post :add_to_cart
      end
    end

    namespace :admin do
      resources :products
      resources :users do
        member do
          post :promote
          post :demote
        end
      end
   end

    resources :carts do
      member do
        post :empty_cart_items
        post :increase_cart_item
        post :decrease_cart_item
      end
      collection do
        post :checkout
      end
    end

    resources :orders do
      member do
        post :pay_with_alipay
        post :pay_with_wechat
      end
    end
end
