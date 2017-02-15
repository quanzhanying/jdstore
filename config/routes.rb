Rails.application.routes.draw do

  root 'products#index'


  namespace :account do
    resources :orders
  end


  namespace :admin do
    resources :products
    resources :orders
  end

  devise_for :users
  root 'welcome#index'

  resources :products do
    member do
      post :add_to_cart
    end
  end



  resources :carts do
    collection do
      delete :clean
       post :checkout
    end
  end

  resources :cart_items

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
