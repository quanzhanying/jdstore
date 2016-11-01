Rails.application.routes.draw do
  devise_for :users

  namespace :admin  do
    resources :products
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts do
    member do
      delete :clear
    end
  end

  resources :cart_items

  root "products#index"

end
