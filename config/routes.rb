Rails.application.routes.draw do
  root 'products#index'
  namespace :admin do
    resources :products
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  devise_for :users
  root 'welcome#index'

  resources :carts
end
