Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :products do
      member do
        get :filter_by_category
      end
    end
    resources :orders
    resources :product_categories
  end
  resources :products do
    member do
      post :add_to_cart
      post :add_to_cart_and_buy
      get :filter_by_category
      post :favorite
    end
  end

  resources :carts do
    member do
      post :clear
      post :remove_product
      post :increase_product
      post :decrease_product
    end

    collection do
      post :checkout
    end
  end

  resources :orders do
    member do
      post :pay_with_ailipay
      post :pay_with_wechat
      post :cancel
      post :ship
    end
  end

  resources :favorites

  root "products#index"
end
