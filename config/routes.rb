Rails.application.routes.draw do
  root 'products#index'
  devise_for :users




  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :cancell_order
      post :ship
    end
  end

  namespace :account do
    resources :orders do
    member do
      post :cancell_order
    end
  end
end

  resources :carts do
    member do
      delete :destroy
      post :checkout

    end
  end

  resources :cart_items do
    member do
      post :add
      post :minus
    end
  end

  namespace :admin do
    resources :products
  end
  #root "admin/products#index"
  resources :products do

     member do
       post :add_to_cart
     end
  end
end
