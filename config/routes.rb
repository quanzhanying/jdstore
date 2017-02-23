Rails.application.routes.draw do
  root 'products#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :products
    resources :orders
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end
  root 'welcome#index'
  resources :carts do
    collection do
      delete :clean
        post :checkout
      resources :cart_items
    end
  end

  namespace :account do
    resources :orders
  end

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
    end
  end
end
