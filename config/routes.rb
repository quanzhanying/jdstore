Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  namespace :admin do
    resources :products
  end

  resources :carts do
    collection do
      delete :clear_cart
      post :checkout
    end

  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :cart_items do
    member do
      post :add_number
      post :reduce_number
    end
  end

  resources :orders

  namespace :account do
    resources :orders
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
