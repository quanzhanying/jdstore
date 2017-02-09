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
      delete :clean
       post :checkout
    end
  end

  resources :cart_items

  resources :orders

  namespace :account do
    resources :orders
 end

  root 'products#index'
end
