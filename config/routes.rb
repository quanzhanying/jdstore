Rails.application.routes.draw do
  root 'welcome#index'
  root 'product#index'
  devise_for :users

  namespace :admin do
    resources :products
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :cart_items

  resources :carts do
    collection do
      delete :clean
       post :checkout
    end
  end
  resources :orders

  namespace :account do
    resources :orders
  end
end
