Rails.application.routes.draw do
   namespace :admin do
      resources :products
   end

   resources :products do
     member do
       post :add_to_cart
     end
   end

  devise_for :users
  root 'products#index'

  resources :carts do
     collection do
       delete :clean
       post :checkout
     end
  end

  resources :cart_items
  resources :orders
end
