Rails.application.routes.draw do
  devise_for :users
  root 'products#index'

  namespace :admin do
    resources :products
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
