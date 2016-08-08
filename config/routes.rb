Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :products
  end

  resources :carts

  resources :products do
    member do
      post :join
      post :quit
      post :add_to_cart
    end
    resources :posts
  end

  namespace :account do
    resources :products
  end



  root 'products#index'

end
