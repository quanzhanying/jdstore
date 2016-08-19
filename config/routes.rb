Rails.application.routes.draw do
  devise_for :users

  resources :products


  # resources :users do
  # end

  namespace :admin do
    resources :products
    resources :users do
      member do
        post :turn_to_user
        post :turn_to_admin
      end
    end
    resources :orders
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
      post :apply_to_cancel
      post :ship
      post :return_good
      delete :destroy
    end
  end

  namespace :account do
    resources :orders
    delete :destroy_order   
  end


  root 'products#index'

end
