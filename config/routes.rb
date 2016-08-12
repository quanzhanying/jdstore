Rails.application.routes.draw do
  devise_for :users

  resources :products do
    member do
      post :add_to_cart
    end
  end

  namespace :admin do
    resources :products
  end

  resources :carts do
    collection do
      post :checkout
    end
  end

  resources :orders
  
  resources :cart_items do
    member do
      post :increment
      post :decrement
    end
  end

  root 'products#index'
end
