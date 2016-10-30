Rails.application.routes.draw do

  get 'orders/index'

  get 'orders/new'

  get 'orders/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'

  # get 网址 , to controller#action
  # get 'no_result', to:'products#no_result'

  namespace :admin do
  	resources :products
  end

  namespace :users do
    resources :delivery_addresses
  end

  resources :products, only: [:show, :index] 

  resources :carts, only: [:index]
  
  resources :cart_items, only: [:create, :destroy]

  resources :orders, only: [:index, :new, :show, :create, :update]

end
