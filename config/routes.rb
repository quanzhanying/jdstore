Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :products
    resources :users do
      member do
        post :user
        post :admin
      end
    end
  end

  delete 'carts', to: 'carts#destroy'

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :products
  resources :carts
  resources :cart_items
  root 'products#index'
end
