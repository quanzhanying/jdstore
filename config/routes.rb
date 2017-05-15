Rails.application.routes.draw do
  devise_for :users
  namespace :account do
   resources :orders
  end
  resources :cart_items
  resources :products do
    member do
      post :add_to_cart
    end
  end
  namespace :admin do
   resources :products
  end
 resources :orders
 resources :carts do
   collection do
     delete :clean
      post :checkout
   end
 end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
end
