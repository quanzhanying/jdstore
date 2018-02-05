Rails.application.routes.draw do
  devise_for :users

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  namespace :account do
    resources :orders
  end

  resources :cart_items
  resources :orders

  resources :products do
    member do
      post :add_to_cart
    end
  end
  root 'products#index'

  namespace :admin do
    resources :products
  end
end
