Rails.application.routes.draw do
  root 'products#index'
  devise_for :users
  resources :orders
  resources :carts do
    collection do
      delete :destroy
      post :checkout
    end
  end
  resources :cart_items

  namespace :admin do
    resources :products
  end
  #root "admin/products#index"
  resources :products do

     member do
       post :add_to_cart
     end
  end
end
