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

  root 'products#index'

  resources :carts do
    collection do
      delete :clean
    end
  end

  resources :cart_items
end
