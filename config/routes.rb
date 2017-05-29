Rails.application.routes.draw do
  namespace :admin do
    resources :products
  end

  devise_for :users

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts do
    member do
      delete :clean
      post :checkout
    end
  end

  resources :cart_items do
    member do
      post :increase
      post :decrease
    end
  end

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
    end
  end

  namespace :account do
    resources :orders
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "products#index"
end
