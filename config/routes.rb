Rails.application.routes.draw do
  devise_for :users
  # root 'admin/products#index'
  root 'products#index'

  namespace :admin do
    resources :products
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts do
    collection do
      delete :cleanup
      post :checkout
    end
  end

  resources :cart_items do
    member do
      post :up
      post :down
    end
  end

  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
