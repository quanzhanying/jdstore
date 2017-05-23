Rails.application.routes.draw do

  devise_for :users

  namespace :admin do
    resources :products do
      member do
        patch :move_up
        patch :move_down


        post  :publish
        post  :hide

      end
    end
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
  end


  root 'products#index'
  resources :products do
    member do
      post :add_to_cart
      post :add_to_wish_list
      post :delete_from_wish_list
    end
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

  resources :cart_items

  namespace :account do
    resources :orders
    resources :products
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
