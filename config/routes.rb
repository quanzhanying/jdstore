Rails.application.routes.draw do
  devise_for :users

  resources :products



  # resources :users do

  namespace :admin do
    resources :products
    resources :users do
      member do
        post :turn_to_user
        post :turn_to_admin
      end
    end
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

   resources :carts do
     member do
        delete :destroy_item
        post :increase_item
        post :decrease_item
        delete :empty_cart_items
      end

      collection do
        post :checkout
      end
    end

  resources :orders do
    member do
      post :pay_with_wechat
      post :pay_with_alipay
    end
  end
    
  
  root 'products#index'

end
