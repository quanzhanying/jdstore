Rails.application.routes.draw do
  root 'products#index'
  devise_for :users
  resources :cart_items
  resources :orders
  namespace :account do
    resources :orders
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  namespace :admin do
  resources :products
end

  resources :products do
    member do
      post :add_to_cart

    end
  end
end
