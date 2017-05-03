Rails.application.routes.draw do
  namespace :admin do
    resources :products
  end
# rails g controller admin/products
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :cart_items
  resources :orders

  namespace :account do
    resources :orders
  end

  root 'products#index'
#root 'admin/products#index'
end
