Rails.application.routes.draw do
  devise_for :users

  resources :products



  # resources :users do

  namespace :admin do
    resources :products
    resources :users do
      member do
        post :turn_to_user
        post :turn_to_admin
      end
    end
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts
  
  root 'products#index'

end
